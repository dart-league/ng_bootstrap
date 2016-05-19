library n2s_date_picker;

import "package:angular2/angular2.dart";
import 'package:intl/intl.dart';
import 'package:ng2_strap/buttons/button-checkbox.dart';
import 'package:ng2_strap/dropdown/index.dart';
import 'package:node_shims/js.dart';

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
5. template-url attribute support
 */

const N2S_DATEPICKER_DIRECTIVES = const [N2sDatePicker, N2sDatePickerPopup];
