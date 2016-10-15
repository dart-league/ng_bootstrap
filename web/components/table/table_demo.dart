import 'package:angular2/core.dart';
import 'package:dson/dson.dart';
import 'package:ng_bootstrap/components/pagination/pagination.dart';
import 'package:ng_bootstrap/components/table/table_directives.dart';
import 'package:ng_bootstrap/components/tabsx/tabsx.dart';
import 'package:node_shims/js.dart';
import 'table_data.dart';
import 'table_data_complex.dart';

@Component (selector: 'table-demo',
    templateUrl: 'table_demo.html',
    directives: const [BS_TABLE_DIRECTIVES, BsPaginationComponent, BS_TABSX_DIRECTIVES])
class TableDemoComponent implements OnInit {
  List rows = [];

  num page = 1;

  num itemsPerPage = 10;

  num maxSize = 5;

  num totalPages;

  num length = 0;

  Map config;

  List data = tableData;

  List rowsComplex = [];

  List dataComplex = tableDataComplex;

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
    } else {
      rows = data.where((item) =>
          (item[config['filtering']['columnName']] as String)
              .contains(config['filtering']['filterString'])
      ).toList();
      rowsComplex = dataComplex.where((item) =>
          (serializable.reflect(item).invokeGetter(config['filtering']['columnName']) as String)
              .contains(config['filtering']['filterString'])
      ).toList();
    }
  }
}