part of bs_date_picker;


const DATE_PICKER_ACCESSOR = const ExistingProvider.forToken(
  ngValueAccessor,
  BsDatePickerComponent,
);


/// Highly configurable component that adds datepicker functionality to
/// your pages. You can customize the date format and language, restrict the selectable date ranges.
///
/// Base specifications: [jquery-ui](https://api.jqueryui.com/datepicker/)
///
/// [demo](http://dart-league.github.io/ng_bootstrap/#datepicker)
@Component(
    selector: "bs-date-picker",
    templateUrl: 'date_picker.html',
    visibility: Visibility.local,
    directives: const [
      BsDayPickerComponent,
      BsMonthPickerComponent,
      BsYearPickerComponent,
      coreDirectives,
      formDirectives
    ],
    providers: const [DATE_PICKER_ACCESSOR])
class BsDatePickerComponent extends BsDatePickerBase implements OnInit {
  /// Constructs a [NgBsDatePicker] component injecting [NgModel], [Renderer], and [HtmlElement]
  BsDatePickerComponent(HtmlElement elementRef) : super(elementRef);

  /// provides access to entered value
  DateTime value;

  /// provides the number of steps needed to change from other views to day view
  Map get stepDay => {"months": 1};

  /// provides the number of steps needed to change from other views to month view
  Map get stepMonth => {"year": 1};

  /// provides the number of steps needed to change from other views to year view
  Map get stepYear => { "years" : yearRange};

  /// provides the modes that can take the date-picker
  @Input()
  List<String> modes = ["day", "month", "year"];

  final _now = new DateTime.now();

  DateTime get _initDate => value ?? _now;

  @ViewChild(BsDayPickerComponent)
  BsDayPickerComponent bsDayPickerComponent;

  @ViewChild(BsMonthPickerComponent)
  BsMonthPickerComponent bsMonthPickerComponent;

  @ViewChild(BsYearPickerComponent)
  BsYearPickerComponent bsYearPickerComponent;

  // todo: add formatter value to DateTime object
  /// initializes attributes
  ngOnInit() {
    bsDayPickerComponent.datePicker = this;
    bsMonthPickerComponent.datePicker = this;
    bsYearPickerComponent.datePicker = this;

    formatDay = or(formatDay, FORMAT_DAY);
    formatMonth = or(formatMonth, FORMAT_MONTH);
    formatYear = or(formatYear, FORMAT_YEAR);
    formatDayHeader = or(formatDayHeader, FORMAT_DAY_HEADER);
    formatDayTitle = or(formatDayTitle, FORMAT_DAY_TITLE);
    formatMonthTitle = or(formatMonthTitle, FORMAT_MONTH_TITLE);
    showWeeks = or(showWeeks, SHOW_WEEKS);
    startingDay = or(startingDay, STARTING_DAY);
    yearRange = or(yearRange, YEAR_RANGE);
    shortcutPropagation = or(shortcutPropagation, SHORTCUT_PROPAGATION);
    datePickerMode = or(datePickerMode, DATEPICKER_MODE);
    minMode = or(minMode, MIN_MODE);
    maxMode = or(maxMode, MAX_MODE);
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
      this.value = value;
      onChange(value);
      refreshView();
//      viewToModelUpdate(value);
    }
  }
  /// compares [date1] and [date2] and returns:
  ///
  /// * 0 if equals
  /// * -1 if [date1] is before [date2]
  /// * 1 if [date1] is after [date2]
  num compare(DateTime date1, DateTime date2) {
    if (date2 == null) return null;

    if (datePickerMode == "day") {
      return new DateTime(date1.year, date1.month, date1.day)
          .compareTo(new DateTime(date2.year, date2.month, date2.day));
    }
    if (datePickerMode == "month") {
      return new DateTime(date1.year, date1.month).compareTo(new DateTime(date2.year, date2.month));
    }
    if (datePickerMode == "year") {
      return new DateTime(date1.year).compareTo(new DateTime(date2.year));
    }
    return null;
  }

  /// performs the view refresh
  refreshView() {
    if (datePickerMode == "day") {
      bsDayPickerComponent.refreshViewHandler();
    }
    if (datePickerMode == "month") {
      bsMonthPickerComponent.refreshViewHandler();
    }
    if (datePickerMode == "year") {
      bsYearPickerComponent.refreshViewHandler();
    }
  }

  /// gets the part of the date in dependence of the format, ie: MMMM, DDD, yyy
  String dateFilter(DateTime date, String format) => new DateFormat(format).format(date);

  ///  checks if date map is active
  bool isActive(DisplayedDate dateObject) => compare(dateObject.date, value) == 0;

  /// Creates a date map containing date, label, selected, disabled and current values
  DisplayedDate createDateObject(DateTime date, String format) => new DisplayedDate(date, dateFilter(date, format),
      compare(date, value) == 0, isDisabled(date), compare(date, new DateTime.now()) == 0);

  // todo: implement dateDisabled attribute
  /// returns `true` if [date] is before [minDate] or after [maxDate]
  bool isDisabled(DateTime date) =>
      minDate != null && compare(date, minDate) < 0 || maxDate != null && compare(date, maxDate) > 0;

  /// splits the [arr] into a list of array of size [size]
  List<List<DisplayedDate>> split(List arr, num size) {
    List<List<DisplayedDate>> arrays = List();
    for (var i = 0; arr.length > i * size; i++) {
      arrays.add(arr.getRange(i * size, i * size + size).toList());
    }
    return arrays;
  }

  /// fired when user clicks one of the date buttons
  select(DateTime date) {
    if (datePickerMode == minMode) {
      writeValue(new DateTime(date.year, date.month, date.day));
    } else {
      var year = datePickerMode == 'year' ? date.year : value.year;
      var month = datePickerMode == 'month' ? date.month : value.month;

      datePickerMode = modes[modes.indexOf(datePickerMode) - 1];
      writeValue(new DateTime(year, month, value.day));
    }
  }

  /// selects the current day date
  selectToday() => select(new DateTime.now());

  /// changes the view values in dependence of the [direction]
  ///
  /// this is fired when users clicks on arrow buttons
  move(num direction) {
    var expectedStep =
          datePickerMode == "day" ? stepDay
        : datePickerMode == "month" ? stepMonth
        : datePickerMode == "year" ? stepYear
        : null;

    if (expectedStep != null) {
      var year = _initDate.year + direction * (expectedStep['years'] ?? 0);
      var month = _initDate.month + direction * (expectedStep['months'] ?? 0);
      writeValue(new DateTime(year, month, 1));
    }
  }

  /// toggles the view mode in dependence of the [direction]
  ///
  /// this is fired when users clicks on day, month, or year header buttons
  toggleMode([num direction]) {
    direction ??= 1;
    if ((datePickerMode == maxMode && direction == 1) || (datePickerMode == minMode && direction == -1)) {
      return;
    }
    datePickerMode = modes[modes.indexOf(datePickerMode) + direction];
    refreshView();
  }
}

abstract class BsDatePickerBase extends Object
    with TouchHandler, ChangeHandler<DateTime>
    implements ControlValueAccessor {
  final HtmlElement _element;
  /// sets date-picker mode, supports: `day`, `month`, `year`
  @Input()
  String datePickerMode;

  /// oldest selectable date
  @Input()
  DateTime minDate;

  /// latest selectable date
  @Input()
  DateTime maxDate;

  /// set lower datepicker mode, supports: `day`, `month`, `year`
  @Input()
  String minMode;

  /// sets upper datepicker mode, supports: `day`, `month`, `year`
  @Input()
  String maxMode;

  /// if `false` week numbers will be hidden
  @Input()
  bool showWeeks;

  /// format of day in month
  @Input()
  String formatDay;

  /// format of month in year
  @Input()
  String formatMonth;

  /// format of year in year range
  @Input()
  String formatYear;

  /// format of day in week header
  @Input()
  String formatDayHeader;

  /// format of title when selecting day
  @Input()
  String formatDayTitle;

  /// format of title when selecting month
  @Input()
  String formatMonthTitle;

  /// starting day of the week from 0-6 (0=Sunday, ..., 6=Saturday).
  @Input()
  num startingDay;

  /// number of years displayed in year selection
  @Input()
  num yearRange;

  /// if `true` shortcut`s event propagation will be disabled
  @Input()
  bool shortcutPropagation;

  // todo: change type during implementation
  /// array of custom classes to be applied to targeted dates
  dynamic customClass;

  // todo: change type during implementation
  /// array of disabled dates if `mode` is `day`, or years, etc.
  @Input()
  dynamic dateDisabled;

  BsDatePickerBase(this._element);

  @override
  void registerOnChange(ChangeFunction<DateTime> fn) {
    this.onChange = (DateTime value, {String rawValue}){
      fn(value == '' ? new DateTime.now() : value);
    };
  }

  @override
  void writeValue(value) {
  }

  @override
  void onDisabledChanged(bool isDisabled) {
    setElementDisabled(_element, isDisabled);
  }


}

class DisplayedDate {
  DisplayedDate(this.date, this.label, this.selected, this.disabled, this.current);

  final DateTime date;
  final String label;
  final bool selected;
  final bool disabled;
  final bool current;
  bool secondary;
}
