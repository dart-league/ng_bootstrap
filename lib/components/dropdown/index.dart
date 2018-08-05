library bs_dropdown;

import "package:angular/angular.dart";
import 'package:js_shims/js_shims.dart';
import 'dart:html';
import 'dart:async';

part "dropdown.dart" ;
part "menu.dart";
part "toggle.dart";
//part "keyboard_nav.dart";

const bsDropdownDirectives = const [BsDropdownDirective, BsDropdownMenuDirective, BsDropdownToggleDirective];

@Deprecated('Renamed to "bsDropdownDirectives')
const NG_BOOTSTRAP_DROPDOWN_DIRECTIVES = bsDropdownDirectives;
