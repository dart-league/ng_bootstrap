library bs_dropdown;

import "package:angular2/angular2.dart";
import 'package:node_shims/js.dart';
import 'dart:html';
import 'dart:async';

part "dropdown.dart" ;
part "menu.dart";
part "toggle.dart";
//part "keyboard_nav.dart";
part "service.dart";

const NG_BOOTSTRAP_DROPDOWN_DIRECTIVES = const [Dropdown, DropdownMenu, DropdownToggle];
