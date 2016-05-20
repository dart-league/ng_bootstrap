library n2s_dropdown;

import "package:angular2/angular2.dart";
import 'package:node_shims/js.dart';
import 'dart:html';
import 'dart:async';

part "dropdown.dart" ;
part "dropdown-menu.dart";
part "dropdown-toggle.dart" ;
part "dropdown-keyboard-nav.dart";
part "dropdown-service.dart";

const NGBS_DROPDOWN_DIRECTIVES = const [NgBsDropdown, NgBsDropdownMenu, NgBsDropdownToggle];
