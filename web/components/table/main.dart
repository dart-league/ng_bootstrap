library table.main;

import 'package:angular2/platform/browser.dart';
import 'table_demo.dart';
import 'package:built_mirrors/built_mirrors.dart';

part 'main.g.dart';

main() {
  _initMirrors();
  bootstrap(TableDemoComponent);
}
