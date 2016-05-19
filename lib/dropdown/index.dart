library n2s_dropdown;

import "package:angular2/angular2.dart";
import 'package:node_shims/js.dart';
import 'dart:html';
import 'dart:async';

part "dropdown.dart" ;
part "dropdown_menu.dart";
part "dropdown_toggle.dart";
part "dropdown_keyboard_nav.dart";
part "dropdown_service.dart";

const NGBS_DROPDOWN_DIRECTIVES = const [NgBsDropdown, NgBsDropdownMenu, NgBsDropdownToggle];
