part of table_directives;

@Component(
    selector: "bs-table",
    template: '''
<table class="table table-striped table-bordered dataTable"
       role="grid" style="width: 100%;">
  <thead>
  <tr role="row">
    <th *ngFor="let column of columns" (click)="toggleSort(column, \$event)">
      {{column.header}}
      <i *ngIf="config != null && column.sort != null" class="pull-right fa"
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
  // Table values
  List _rows;

  @Input() set rows(List rows) {
    _rows = rows;
    rowsAux = rows.toList();
    pageNumber = 1;
  }

  List rowsAux;

  List rowsPage;

  @Input() Map config = {};

  @Output() EventEmitter tableChanged = new EventEmitter();

  List<BsColumnDirective> columns = [];

  @Input() bool sortable;

  @Input() num itemsPerPage = 10;

  num _pageNumber = 1;

  num get pageNumber => _pageNumber;

  @Input() set pageNumber(num pageNumber) {
    _pageNumber = pageNumber ?? 1;
    pageNumberChange.emit(_pageNumber);
  }

  @Output() EventEmitter<num> pageNumberChange = new EventEmitter();

  @Output() EventEmitter<num> totalItemsChange = new EventEmitter();

  @HostListener('pageNumberChange')
  void updatePage() {
    var start = (pageNumber - 1) * itemsPerPage;
    var end = min(rowsAux.length, start + itemsPerPage);
    rowsPage = rowsAux.getRange(start, end).toList();
    totalItemsChange.emit(rowsAux.length);
  }

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
        if(c.fieldName != column.fieldName && c.sort != 'NO_SORTABLE') c.sort = 'NONE';
      });
      updatePage();
    }
  }

  String getData(dynamic row, String propertyName) =>
      propertyName.split('.').fold(row, (prev, String curr) => prev[curr].toString());
}
