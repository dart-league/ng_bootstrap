import "package:angular2/core.dart";
import "package:ng_bootstrap/components/table/table_sorting_directive.dart";
import 'package:node_shims/js.dart';

@Component(
    selector: "bs-table",
    template: '''
<table class="table table-striped table-bordered dataTable"
       role="grid" style="width: 100%;">
  <thead>
  <tr role="row">
    <th *ngFor="let column of columns" [bsTableSorting]="config" [column]="column" (sortChanged)="onChangeTable(\$event)">
      {{column['title']}}
      <i *ngIf="config != null && column['sort'] != null" class="pull-right fa"
        [ngClass]="{\'fa-chevron-down\': column['sort'] == \'desc\', \'fa-chevron-up\': column['sort'] == \'asc\'}"></i>
    </th>
  </tr>
  </thead>
  <tbody>
  <tr *ngFor="let row of rows">
    <td *ngFor="let column of columns">{{getData(row, column['name'])}}</td>
  </tr>
  </tbody>
</table>
''',
    directives: const [TableSortingDirective])
class TableComponent {
  // Table values
  @Input()
  List rows = [];
  @Input()
  dynamic config = {};

  // Outputs (Events)
  @Output()
  EventEmitter<dynamic> tableChanged = new EventEmitter();

  @Input()
  set columns(List values) {
    values.forEach((dynamic value) {
      var column = this._columns.firstWhere((col) => identical(col['name'], value['name']), orElse: () => null);
      if (truthy(column)) {
//        Object.assign(column, value);
        column = value;
      }
      if (falsey(column)) {
        this._columns.add(value);
      }
    });
  }

  List get columns {
    return this._columns;
  }

  dynamic get configColumns {
    List sortColumns = [];
    this.columns.forEach((dynamic column) {
      if (truthy(column['sort'])) {
        sortColumns.add(column);
      }
    });
    return {"columns": sortColumns};
  }

  List _columns = [];

  void onChangeTable(dynamic column) {
    this._columns.forEach((dynamic col) {
      if (!identical(col['name'], column['name']) && !identical(col['sort'], false)) {
        col['sort'] = "";
      }
    });
    this.tableChanged.emit({'sorting': this.configColumns});
  }

  String getData(dynamic row, String propertyName) {
    return propertyName
        .split(".")
        .fold(row, (prev, String curr) =>
    prev[curr].toString());
  }
}
