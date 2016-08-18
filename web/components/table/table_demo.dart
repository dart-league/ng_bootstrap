import 'dart:math';
import 'package:angular2/core.dart';
import 'package:ng_bootstrap/components/pagination/pagination.dart';
import 'package:ng_bootstrap/components/table/table_directives.dart';
import 'package:node_shims/js.dart';
import 'table_data.dart';

// webpack html imports
@Component (selector: 'table-demo',
    templateUrl: 'table_demo.html',
    directives: const [NG_BOOTSTRAP_TABLE_DIRECTIVES, Pagination])
class TableDemoComponent implements OnInit {
  List rows = [];

  num page = 1;

  num itemsPerPage = 10;

  num maxSize = 5;

  num get numPages => length ~/ itemsPerPage + 1;

  num length = 0;

  Map config;

  List data = tableData;

  TableDemoComponent() {
    config = {
      'paging' : true,
      'filtering' : {
        'filterString' : '',
        'columnName' : 'position'
      }
    };
  }

  void ngOnInit() {
    this.filterRows();
  }

  void filterRows() {
    if (falsey(config['filtering'])) {
      rows = data.toList();
    } else {}
    rows = data.where((item) =>
        (item[config['filtering']['columnName']] as String).contains(this.config['filtering']['filterString']))
        .toList();
  }
}