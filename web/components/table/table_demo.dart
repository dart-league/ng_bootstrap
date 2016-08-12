import 'package:angular2/core.dart';
import 'package:ng_bootstrap/components/pagination/pagination.dart';
import 'package:ng_bootstrap/components/table/table_directives.dart';
import 'package:node_shims/js.dart';
import "table_data.dart";

// webpack html imports
@Component (selector: "table-demo",
    templateUrl: "table_demo.html",
    directives: const [NG_BOOTSTRAP_TABLE_DIRECTIVES, Pagination])
class TableDemoComponent implements OnInit {
  List rows = [];

  List columns = [
    { "title" : "Name", "name" : "name"},
    { "title" : "Position", "name" : "position", "sort" : false},
    { "title" : "Office", "name" : "office", "sort" : "asc"},
    { "title" : "Extn.", "name" : "ext", "sort" : ""},
    { "title" : "Start date", "name" : "startDate"},
    { "title" : "Salary (\$)", "name" : "salary"}
  ];

  num page = 1;

  num itemsPerPage = 10;

  num maxSize = 5;

  num numPages = 1;

  num length = 0;

  Map config;

  List data = TableData;

  TableDemoComponent() {
    config = {
      "paging" : true,
      "sorting" : {
        "columns" : this.columns
      },
      "filtering" : {
        "filterString" : "",
        "columnName" : "position"
      }
    };
    this.length = this.data.length;
  }

  void ngOnInit() {
    this.onChangeTable(this.config);
  }

  List changePage(Map page, [List data]) {
    data ??= this.data;
    print(page);
    var start = (page['page'] - 1) * page['itemsPerPage'];
    var end = page['itemsPerPage'] > -1 ? (start + page['itemsPerPage']) : data.length;
    return slice(data, start, end);
  }

  changeSort(List data, Map config) {
    if (falsey(config['sorting'])) {
      return data;
    }
    var columns = this.config['sorting']['columns'] ?? [];
    String columnName;
    String sort;
    for (var i = 0; i < columns.length; i ++) {
      if (!identical(columns[i]['sort'], "") && !identical(columns[i]['sort'], false)) {
        columnName = columns[i]['name'];
        sort = columns[i]['sort'];
      }
    }
    if (falsey(columnName)) {
      return data;
    }
    // simple sorting
    return data..sort((previous, current) {
      return sort == 'desc' ? previous[columnName].compareTo(current[columnName]) :
              sort == 'asc' ? current[columnName].compareTo(previous[columnName]) :
              0;
    });
  }

  List changeFilter(List data, Map config) {
    if (falsey(config['filtering'])) {
      return data;
    }
    var filteredData = data.where((item) =>
        (item[config['filtering']['columnName']] as String).contains(this.config['filtering']['filterString']));
    return filteredData.toList();
  }

  onChangeTable(Map config, [Map page]) {
    page ??= {"page" : this.page, "itemsPerPage" : this.itemsPerPage};
    if (config['filtering'] != null) {
      this.config['filtering'] = config['filtering'];
    }
    if (config['sorting'] != null) {
      this.config['sorting'] = config['sorting'];
    }
    var filteredData = this.changeFilter(this.data, this.config);
    var sortedData = this.changeSort(filteredData, this.config);
    this.rows = page != null && config['paging'] ? this.changePage(page, sortedData) : sortedData;
    this.length = sortedData.length;
  }
}