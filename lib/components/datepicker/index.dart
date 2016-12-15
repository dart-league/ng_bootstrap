library bs_date_picker;

import "package:angular2/angular2.dart";
import 'package:angular2/src/common/pipes/date_pipe.dart';
import 'package:intl/intl.dart';
import 'package:node_shims/js.dart';
import 'package:ng_bootstrap/components/dropdown/index.dart';
import 'package:ng_bootstrap/components/button/toggle.dart';

part "date_picker.dart";
part 'date_picker_inner.dart';
part "date_picker_popup.dart";
part 'day_picker.dart';
part 'month_picker.dart';
part 'year_picker.dart';
/*
todo: general:
1. Popup
2. Keyboard support
3. custom-class attribute support
4. date-disabled attribute support
 */

const NG_BOOTSTRAP_DATEPICKER_DIRECTIVES = const [BsDatePickerComponent, BsDatePickerPopupComponent];
