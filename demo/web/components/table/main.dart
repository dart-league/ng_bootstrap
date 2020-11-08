library table.main;

import 'package:angular/angular.dart';
import 'table_demo.dart';
import 'package:dson/dson.dart';
import 'table_demo.template.dart' show TableDemoComponentNgFactory;

part 'main.g.dart';

void main() {
  _initMirrors();
  runApp(TableDemoComponentNgFactory);
}
