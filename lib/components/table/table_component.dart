part of table_directives;

/// Creates a table component to handle data
///
/// example:
///
/// ```html
/// <bs-table rows="persons">
///   <bs-column header="Name" fieldName="name">
///   <bs-column header="Age" fieldName="age">
/// <bs-table>
/// ```
///
/// [demo](http://luisvt.github.io/ng2_strap/#table)
@Component(
    selector: 'bs-table',
    template: '''
<table class="table table-striped table-bordered dataTable"
       role="grid" style="width: 100%;">
  <thead>
  <tr role="row">
    <th *ngFor="let column of columns" (click)="toggleSort(column, \$event)">
      {{column.header}}
      <i *ngIf="sortable && column.sort != null" class="pull-right fa"
        [ngClass]="{\'fa-chevron-down\': column.sort == \'DES\', \'fa-chevron-up\': column.sort == \'ASC\'}"></i>
    </th>
  </tr>
  </thead>
  <tbody>
  <tr *ngFor="let row of rowsPage">
    <td *ngFor="let column of columns">{{getData(row, column.fieldName)}}</td>
  </tr>
  </tbody>
</table>
''')
class BsTableComponent {
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

  /// Emits when occurs a change on the table
  @Output() EventEmitter tableChanged = new EventEmitter();

  /// Handles the columns of the table
  List<BsColumnDirective> columns = [];

  /// Sets if the table-columns are sortable or not
  @Input() bool sortable = true;

  /// Sets the maximum items that will be displayed per page
  @Input() num itemsPerPage = 10;

  /// Handles the current page number displayed
  num _pageNumber = 1;

  /// Gets the current page number
  num get pageNumber => _pageNumber;

  /// Sets the current page number
  @Input() set pageNumber(num pageNumber) {
    _pageNumber = pageNumber ?? 1;
    pageNumberChange.emit(_pageNumber);
  }

  /// Emits when the page number has changed
  @Output() EventEmitter<num> pageNumberChange = new EventEmitter();

  /// Emits when the total items has changed
  @Output() EventEmitter<num> totalItemsChange = new EventEmitter();

  /// Updates the items displayed in the page whenever occurs a [pageNumberChange]
  @HostListener('pageNumberChange')
  void updatePage() {
    var startIndex = (pageNumber - 1) * itemsPerPage;
    var endIndex = min(rowsAux.length, startIndex + itemsPerPage);
    rowsPage = rowsAux.getRange(startIndex, endIndex).toList();
    totalItemsChange.emit(rowsAux.length);
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
          var comparison = getData(r1, column.fieldName).compareTo(getData(r2, column.fieldName));
          return column.sort == 'ASC' ? comparison : -comparison;
        });
      } else {
        rowsAux = _rows.toList();
      }
      columns.forEach((c) {
        if (c.fieldName != column.fieldName && c.sort != 'NO_SORTABLE') c.sort = 'NONE';
      });
      updatePage();
    }
  }

  // Todo: accepts complex-objects
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
  /// if the value of row is a [Map]
  String getData(dynamic row, String fieldName) =>
      fieldName.split('.').fold(row, (prev, String curr) => prev[curr].toString());
}
