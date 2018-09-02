library table.main;

import 'package:angular/angular.dart';
import 'table_demo.dart';
import 'package:dson/dson.dart';

// ignore: uri_has_not_been_generated
import 'table_demo.template.dart' show TableDemoComponentNgFactory;

part 'main.g.dart';

main() {
  _initMirrors();
  runApp(TableDemoComponentNgFactory);
}
