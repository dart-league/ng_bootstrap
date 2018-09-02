library bs_table_directives;

import 'dart:async';
import 'dart:html';
import 'dart:math';

import "package:angular/angular.dart";
import 'package:angular_forms/angular_forms.dart';
import 'package:ng_bootstrap/components/input/input.dart';

part 'column_directive.dart';
part 'table_component.dart';
part 'column_editor_directive.dart';

/// Directives needed for creating data table components
const bsTableDirectives = const [
  BsTableComponent,
  BsColumnDirective,
  BsColumnEditorDirective,
  BsInput
];

@Deprecated('Renamed to "bsTableDirectives"')
const BS_TABLE_DIRECTIVES = bsTableDirectives;