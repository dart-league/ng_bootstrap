library table.main;

import 'package:angular/angular.dart';
import 'table_demo.dart';
import 'package:built_mirrors/built_mirrors.dart';

part 'main.g.dart';

main() {
  _initMirrors();
  bootstrap(TableDemoComponent);
}
