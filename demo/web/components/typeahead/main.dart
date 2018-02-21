library typeahead.main;

import 'package:angular/angular.dart';

import 'typeahead_demo.dart';
import 'package:dson/dson.dart';

// ignore: uri_has_not_been_generated
import 'main.template.dart' as ng_generated;

part 'main.g.dart';

main() async {
  _initMirrors();
  bootstrapStatic(TypeaheadDemo, [], ng_generated.initReflector);
}
