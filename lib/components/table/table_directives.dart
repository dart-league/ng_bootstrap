library table_directives;

import 'dart:html';
import 'dart:math';
import "package:angular2/core.dart";

part 'column_directive.dart';
part 'table_component.dart';

/// Directives needed for creating data table components
const NG_BOOTSTRAP_TABLE_DIRECTIVES = const [
  BsTableComponent,
  BsColumnDirective
];
