library bs_date_picker;

import 'dart:html';
import "package:angular/angular.dart";
import 'package:intl/intl.dart';
import 'package:js_shims/js_shims.dart';
import 'package:ng_bootstrap/components/dropdown/index.dart';
import 'package:ng_bootstrap/components/button/toggle.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_forms/src/directives/shared.dart';
import 'package:angular_forms/src/directives/control_value_accessor.dart';

part "date_picker.dart";
part "date_picker_popup.dart";
part 'day_picker.dart';
part 'month_picker.dart';
part 'year_picker.dart';
/*
todo: general:
1. Keyboard support
2. custom-class attribute support
3. date-disabled attribute support
 */

const String FORMAT_DAY = "dd";

const String FORMAT_MONTH = "MMMM";

const String FORMAT_YEAR = "yyyy";

const String FORMAT_DAY_HEADER = "E";

const String FORMAT_DAY_TITLE = "MMMM yyyy";

const String FORMAT_MONTH_TITLE = "MMMM";

const String DATEPICKER_MODE = "day";

const String MIN_MODE = "day";

const String MAX_MODE = "year";

const bool SHOW_WEEKS = true;

const num STARTING_DAY = 0;

const num YEAR_RANGE = 20;

const DateTime MIN_DATE = null;

const DateTime MAX_DATE = null;

const bool SHORTCUT_PROPAGATION = false;

const NG_BOOTSTRAP_DATEPICKER_DIRECTIVES = const [BsDatePickerComponent, BsDatePickerPopupComponent];
