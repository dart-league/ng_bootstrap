library table.main;

import 'package:angular/angular.dart';
import 'table_demo.dart';
import 'package:dson/dson.dart';

// ignore: uri_has_not_been_generated
import 'main.template.dart' as ng_generated;

part 'main.g.dart';

main() {
  _initMirrors();
  bootstrapStatic(TableDemoComponent, [], ng_generated.initReflector);
}
