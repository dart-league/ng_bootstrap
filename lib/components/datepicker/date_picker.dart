part of bs_date_picker;

/// Highly configurable component that adds datepicker functionality to
/// your pages. You can customize the date format and language, restrict the selectable date ranges.
///
/// Base specifications: [jquery-ui](https://api.jqueryui.com/datepicker/)
///
/// [demo](http://luisvt.github.io/ng2_strap/#datepicker)
@Component (selector: "bs-date-picker",
    templateUrl: 'date_picker.html',
    directives: const [
      BsDatePickerInnerComponent,
      BsDayPickerComponent,
      BsMonthPickerComponent,
      BsYearPickerComponent
    ])
class BsDatePickerComponent extends DefaultValueAccessor with BsDatePickerBase {
  /// Constructs a [NgBsDatePicker] component injecting [NgModel], [Renderer], and [ElementRef]
  BsDatePickerComponent(this.ngModel, ElementRef elementRef)
      : super(elementRef) {
    ngModel.valueAccessor = this;
  }

  /// provides access to entered value
  NgModel ngModel;

  /// provides access to the child datePickerInner
  @ViewChild(BsDatePickerInnerComponent)
  BsDatePickerInnerComponent datePickerInner;

  /// provides the value of selected date
  DateTime _activeDate;

  /// gets the value of selected date
  DateTime get activeDate => _activeDate;

  /// sets the value of selected date
  @Input() set activeDate(DateTime value) {
    _activeDate = value;
    ngModel.viewToModelUpdate(value);
  }

  /// writes value from the view
  writeValue(dynamic value) async {
    if (value != null) {
      if (value is String) {
        try {
          value = DateTime.parse(value);
        } catch (e) {
          return; // ignore: return_without_value
        }
      }
      activeDate = value;
    }
  }
}

abstract class BsDatePickerBase {

  /// sets date-picker mode, supports: `day`, `month`, `year`
  @Input() String datePickerMode;

  @Input() DateTime initDate;

  /// oldest selectable date
  @Input() DateTime minDate;

  /// latest selectable date
  @Input() DateTime maxDate;

  /// set lower datepicker mode, supports: `day`, `month`, `year`
  @Input() String minMode;

  /// sets upper datepicker mode, supports: `day`, `month`, `year`
  @Input() String maxMode;

  /// if `false` week numbers will be hidden
  @Input() bool showWeeks;

  /// format of day in month
  @Input() String formatDay;

  /// format of month in year
  @Input() String formatMonth;

  /// format of year in year range
  @Input() String formatYear;

  /// format of day in week header
  @Input() String formatDayHeader;

  /// format of title when selecting day
  @Input() String formatDayTitle;

  /// format of title when selecting month
  @Input() String formatMonthTitle;

  /// starting day of the week from 0-6 (0=Sunday, ..., 6=Saturday).
  @Input() num startingDay;

  /// number of years displayed in year selection
  @Input() num yearRange;

  /// if `true` shortcut`s event propagation will be disabled
  @Input() bool shortcutPropagation;

  // todo: change type during implementation
  /// array of custom classes to be applied to targeted dates
  dynamic customClass;

  // todo: change type during implementation
  /// array of disabled dates if `mode` is `day`, or years, etc.
  @Input() dynamic dateDisabled;
}