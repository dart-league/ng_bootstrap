part of bs_table_directives;

/// Creates a table component to handle data
///
/// example:
///
/// ```html
/// <bs-table rows="persons">
///   <template bs-column header="id" orderBy="age" let-row>{{row.id}}</template>
///   <template bs-column header="Name" orderBy="fullNameSorter" let-row>{{row.firstName}} {{row.lastName}}</template>
///   <template bs-column header="Age" orderBy="age" let-row>{{row.age}}</template>
/// <bs-table>
/// ```
///
/// [demo](http://luisvt.github.io/ng2_strap/#table)
@Component(
    selector: 'bs-table',
    templateUrl: 'table_component.html',
    directives: const [coreDirectives, formDirectives, BsInput])
class BsTableComponent {
  BsTableComponent() {
    pageNumberChange.listen(updatePage);
    editing = new List.filled(itemsPerPage, false);
  }

  /// Saves the initial values coming from the html attribute
  List _rows;

  /// Sets the value of the rows that will be displayed by the table
  @Input() set rows(List rows) {
    _rows = rows;
    rowsAux = rows.toList();
    pageNumber = 1;
  }

  /// Value that handle the filtered and sorted rows
  List rowsAux;

  /// Handles the rows that will be displayed by the current page
  List rowsPage;

  final _tableChanged = new StreamController<dynamic>.broadcast();

  /// Emits when occurs a change on the table
  @Output() Stream get tableChanged => _tableChanged.stream;

  /// Handles the columns of the table
  @ContentChildren(BsColumnDirective)
  List<BsColumnDirective> columns;

  /// Sets if the table-columns are sortable or not
  @Input() bool sortable = true;

  /// Sets the maximum items that will be displayed per page
  @Input() num itemsPerPage = 10;

  /// Handles the current page number displayed
  num _pageNumber = 1;

  /// Gets the current page number
  num get pageNumber => _pageNumber;

  List<bool> editing;

  /// Sets the current page number
  @Input() set pageNumber(num pageNumber) {
    _pageNumber = pageNumber ?? 1;
    _pageNumberChangeCtrl.add(_pageNumber);
  }

  final _pageNumberChangeCtrl = new StreamController<int>.broadcast();

  /// Emits when the page number has changed
  @Output() Stream<int> get pageNumberChange => _pageNumberChangeCtrl.stream;

  final _totalItemsChangeCtrl = new StreamController<int>.broadcast();

  /// Emits when the total items has changed
  @Output() Stream<int> get totalItemsChange => _totalItemsChangeCtrl.stream;

  @Input() bool selectable = false;

  Set selectedRows = new Set();

  bool get isSelectedAll => rowsPage != null && selectedRows != null && rowsPage.length == selectedRows.length;

  var _clonedRow = {};

  selectAll() {
    if (isSelectedAll)
      selectedRows.clear();
    else
      selectedRows.addAll(rowsPage);
  }

  bool isSelected(row) => selectedRows.contains(row);

  selectRow(MouseEvent event, row) {
    if(!selectable) return;
    if (!isSelected(row))
      selectedRows.add(row);
    else
      selectedRows.remove(row);
    event.stopPropagation();
  }

  /// Updates the items displayed in the page whenever occurs a [pageNumberChange]
  @HostListener('pageNumberChange', const ['\$event'])
  void updatePage(num pageNumber) {
    var startIndex = (pageNumber - 1) * itemsPerPage;
    var endIndex = min(rowsAux.length, startIndex + itemsPerPage);
    rowsPage = rowsAux.getRange(startIndex, endIndex).toList();
    _totalItemsChangeCtrl.add(rowsAux.length);
    selectedRows.clear();
  }

  /// toggles the sort direction of the column
  void toggleSort(BsColumnDirective column, MouseEvent event) {
    event.preventDefault();

    if (column.sort != 'NO_SORTABLE') {
      switch (column.sort) {
        case 'ASC':
          column.sort = 'DES';
          break;
        case 'DES':
          column.sort = 'NONE';
          break;
        default:
          column.sort = 'ASC';
          break;
      }
      if (column.sort != 'NONE') {
        rowsAux.sort((r1, r2) {
          var orderBy = column.orderBy ?? column.fieldName;
          var comparison;
          if (orderBy is String) {
            comparison = getData(r1, orderBy)
                .compareTo(getData(r2, orderBy));
          } else if (orderBy is Function) {
            comparison = orderBy(r1, r2);
          } else {
            throw new Exception('The type of `orderBy` or `fieldName` is incorrect.'
                'Please use `String` or `Function` for `orderBy`'
                'and `String` for fieldName');
          }
          return column.sort == 'ASC' ? comparison : -comparison;
        });
      } else {
        rowsAux = _rows.toList();
      }
      columns.forEach((c) {
        if (c.fieldName != column.fieldName && c.sort != 'NO_SORTABLE') c.sort = 'NONE';
      });
      updatePage(pageNumber);
    }
  }

  _getDataFn(prev, String curr) =>
      prev is Map
      ? prev[curr]
          : throw new Exception('Type of prev is not supported, please use a Map, SerializableMap or an String');

  /// Gets the data from the value of the row with the specified field name.
  /// If the fieldName contains `.` it splits the values and loops over the row
  /// fields until find the matching one. For example if user specifies:
  ///
  /// ```html
  /// <bs-table rows="persons">
  ///   ...
  ///   <bs-column fieldName="address.street"></bs-column>
  ///   ...
  /// </bs-table>
  /// ```
  ///
  /// this function should return the value corresponding to `row['address']['street']`
  /// if the value of the row is a [Map], or `row.address.street` if the value of the row
  /// is a complex object.
  String getData(dynamic row, String fieldName) =>
      fieldName.split('.').fold(row, _getDataFn).toString();

  void setData(dynamic row, String fieldName, dynamic value) {
    if (fieldName.contains('.')) {
      var names = fieldName.split('.');
      var lastName = names.removeLast();
      names.fold(row, _getDataFn)[lastName] = value;
    } else {
      row[fieldName] = value;
    }
  }

  startEditingRow(dynamic row, int index) {
    for(var column in columns) {
      _clonedRow[column.fieldName] = getData(row, column.fieldName);
    }
    editing[index] = true;
  }

  saveRow(dynamic row, int index) {
    editing[index] = false;
    print('saving: $row');
  }

  cancelRow(dynamic row, int index, Event event) {
    event.preventDefault();
    for (var column in columns) {
      setData(row, column.fieldName, _clonedRow[column.fieldName]);
    }
    editing[index] = false;
  }
}
