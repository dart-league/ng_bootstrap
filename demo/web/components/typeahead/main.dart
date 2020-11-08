library typeahead.main;

import 'package:angular/angular.dart';

import 'typeahead_demo.dart';
import 'package:dson/dson.dart';
import 'typeahead_demo.template.dart' show TypeaheadDemoNgFactory;

part 'main.g.dart';

void main() {
  _initMirrors();
  runApp(TypeaheadDemoNgFactory);
}
