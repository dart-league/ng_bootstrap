library bs_table_directives;

import 'dart:async';
import 'dart:html';
import 'dart:math';

import "package:angular/angular.dart";

import '../template_outlet/bs_template_outlet.dart';

part 'column_directive.dart';
part 'table_component.dart';

/// Directives needed for creating data table components
const BS_TABLE_DIRECTIVES = const [
  BsTableComponent,
  BsColumnDirective
];
