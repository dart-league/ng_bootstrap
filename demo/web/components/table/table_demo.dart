library table.table_demo;

import 'dart:async';
import 'dart:convert';

import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:dson/dson.dart';
import 'package:http/browser_client.dart';
import 'package:http/http.dart';
import 'package:ng_bootstrap/components/pagination/pagination.dart';
import 'package:ng_bootstrap/components/table/table_directives.dart';
import 'package:ng_bootstrap/components/tabsx/tabsx.dart';
import 'package:js_shims/js_shims.dart';
import 'table_data.dart';
import 'table_data_complex.dart';
export 'table_data_complex.dart';

part 'table_demo.g.dart';

class TableConfig {
  num page = 1;
  num itemsPerPage = 10;
  num maxSize = 5;
  num totalPages;
  num totalItems = 0;
  bool selectable;
  bool hideSelectColumn = false;
  bool editable = false;
  bool searchable = false;
  String filteredColumn = 'position';
  List rows = [];
  String filterString;
  BsColumnDirective sortedColumn;
  Timer debounceTimer;
}

@Component (selector: 'table-demo',
    templateUrl: 'table_demo.html',
    directives: const [
      bsTableDirectives,
      BsPaginationComponent,
      bsTabsxDirectives,
      coreDirectives,
      formDirectives
    ],
    providers: [
      ClassProvider(Client, useClass: BrowserClient)
    ],
    pipes: [commonPipes])
class TableDemoComponent implements OnInit {
  TableConfig mapConfig = TableConfig();
  TableConfig complexConfig = TableConfig();
  TableConfig remoteMapConfig = TableConfig();
  TableConfig remoteComplexConfig = TableConfig();

  Client client;

  Map<String, dynamic> filters = {};

  TableDemoComponent(this.client);

  void ngOnInit() {
    this.filterRows();
    this.filterComplexRows();
  }

  void handleSalaryFiltererChange(String comparer, event, BsColumnDirective column) {
    Map filterValue = column.filterValue ?? {};

    if (filterValue.containsKey(comparer) && falsey(event.target.value)) {
      filterValue.remove(comparer);
    } else {
      filterValue[comparer] = event.target.valueAsNumber;
    }
    column.filterValue = filterValue;

    filterRowsByColumn(column);
  }

  void filterRowsByColumn(BsColumnDirective column) {
    if (falsey(column.filterValue)) {
      filters.remove(column.fieldName);
    } else {
      filters[column.fieldName] = column.filterValue;
    }

    mapConfig.rows = data.where((item) =>
        filters.keys.every((fieldName) {
          if (filters[fieldName] is String) {
            return item[fieldName].contains(filters[fieldName]);
          } else {
            bool get = true, let = true;
            if (filters[fieldName].containsKey('>=')) {
              get = item[fieldName] >= filters[fieldName]['>='];
            }
            if (filters[fieldName].containsKey('<=')) {
              let = item[fieldName] <= filters[fieldName]['<='];
            }
            return get && let;
          }
        })).toList();
  }

  void filterRows() {
    if (falsey(mapConfig.filterString)) {
      mapConfig.rows = data;
    } else {
      mapConfig.rows = data.where((item) =>
          (item[mapConfig.filteredColumn] as String)
              .contains(mapConfig.filterString)
      ).toList();
    }
  }

  void filterComplexRows() {
    if (falsey(complexConfig.filterString)) {
      complexConfig.rows = dataComplex;
    } else {
      complexConfig.rows = dataComplex.where((item) =>
          (item[complexConfig.filteredColumn] as String)
              .contains(complexConfig.filterString)
      ).toList();
    }
  }

  void filterRemoteRows([num currentPage = 1, BsColumnDirective column]) async {
    if (remoteMapConfig.debounceTimer != null) return;
    remoteMapConfig.debounceTimer = new Timer(Duration(milliseconds: 500), () {
      remoteMapConfig.debounceTimer = null;
    });

    remoteMapConfig.page = currentPage;
    remoteMapConfig.sortedColumn = column ?? remoteMapConfig.sortedColumn;
    var sortedColumn = remoteMapConfig.sortedColumn;
    var uri = 'https://jsonplaceholder.typicode.com/posts?'
        + (sortedColumn == null || sortedColumn.sort == 'NONE'
            ? ''
            : '_sort=${sortedColumn.fieldName}&_order=${sortedColumn.sort}&')
        + '_page=${remoteMapConfig.page}&_limit=${remoteMapConfig.itemsPerPage}';
    var response;
    if (falsey(remoteMapConfig.filterString)) {
      response = await client.get(uri);
//      remoteMapConfig.totalItems = int.parse(response.headers['x-total-count']);
      remoteMapConfig.totalItems = 100;
    } else {
      response = await client.get('$uri&q=${remoteMapConfig.filterString}');
      remoteMapConfig.totalItems = int.parse(response.headers['x-total-count']);
    }
    remoteMapConfig.rows = fromJson(response.body, [() => List<Post>(), Post]);
  }

  void filterRemoteComplexRows([num currentPage = 1, BsColumnDirective column]) async {
    if (remoteComplexConfig.debounceTimer != null) return;
    remoteComplexConfig.debounceTimer = new Timer(Duration(milliseconds: 500), () {
      remoteComplexConfig.debounceTimer = null;
    });

    remoteComplexConfig.page = currentPage;
    remoteComplexConfig.sortedColumn = column ?? remoteComplexConfig.sortedColumn;
    var sortedColumn = remoteComplexConfig.sortedColumn;
    var uri = 'https://jsonplaceholder.typicode.com/posts?'
        + (sortedColumn == null || sortedColumn.sort == 'NONE'
            ? ''
            : '_sort=${sortedColumn.fieldName}&_order=${sortedColumn.sort}&')
        + '_page=${remoteComplexConfig.page}&_limit=${remoteComplexConfig.itemsPerPage}';
    var response;
    if (falsey(remoteComplexConfig.filterString)) {
      response = await client.get(uri);
//      remoteMapConfig.totalItems = int.parse(response.headers['x-total-count']);
      remoteComplexConfig.totalItems = 100;
    } else {
      response = await client.get('$uri&q=${remoteComplexConfig.filterString}');
      remoteComplexConfig.totalItems = int.parse(response.headers['x-total-count']);
    }
    remoteComplexConfig.rows = fromJson(response.body, [() => List<Post>(), Post]);
  }
}

@serializable
class Post extends _$PostSerializable {
  int id;
  String title;
  String body;
  int userId;
}