library typeahead.main;

import 'package:angular/angular.dart';

import 'typeahead_demo.dart';
import 'package:dson/dson.dart';

// ignore: uri_has_not_been_generated
import 'typeahead_demo.template.dart' show TypeaheadDemoNgFactory;

part 'main.g.dart';

main() async {
  _initMirrors();
  runApp(TypeaheadDemoNgFactory);
}
