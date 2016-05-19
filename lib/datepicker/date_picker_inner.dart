part of n2s_date_picker;

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

/// Component that will be inside a [N2sDatePicker], this component serve as container for
/// [N2sDayPicker] [N2sMonthPicker] and [N2sYearPicker]
@Component (selector: "n2s-datepicker-inner",
    templateUrl: 'date_picker_inner.html')
class N2sDatePickerInner extends N2sDatePickerBase implements OnInit {

  /// provides the number of steps needed to change from other views to day view
  Map stepDay = {};

  /// provides the number of steps needed to change from other views to month view
  Map stepMonth = {};

  /// provides the number of steps needed to change from other views to year view
  Map stepYear = {};

  /// provides the modes that can take the date-picker
  @Input() List<String> modes = ["day", "month", "year"];

  /// provides a function handler to refresh day view
  Function refreshViewHandlerDay;

  /// provides a function handler to compare active day
  Function compareHandlerDay;

  /// provides a function handler to refresh month view
  Function refreshViewHandlerMonth;

  /// provides a function handler to compare active month
  Function compareHandlerMonth;

  /// provides a function handler to refresh year view
  Function refreshViewHandlerYear;

  /// provides a function handler to compare active year
  Function compareHandlerYear;

  @Output() EventEmitter update = new EventEmitter ();

  /// provides access to active date
  DateTime _activeDate;

  /// gets access to active date
  DateTime get activeDate {
    return _activeDate;
  }

  /// sets access to active date
  @Input() set activeDate(DateTime value) {
    _activeDate = value;
    refreshView();
  }

  // todo: add formatter value to DateTime object
  /// initializes attributes
  ngOnInit() {
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
    if (initDate != null) {
      activeDate = initDate;
    } else {
      activeDate = new DateTime.now();
    }
    update.add(activeDate);
    refreshView();
  }

  /// sets the compare handler to be used in dependence of the view
  setCompareHandler(Function handler, String type) {
    if (type == "day") {
      compareHandlerDay = handler;
    }
    if (type == "month") {
      compareHandlerMonth = handler;
    }
    if (type == "year") {
      compareHandlerYear = handler;
    }
  }

  /// compares [date1] and [date2] and returns:
  ///
  /// * 0 if equals
  /// * -1 if [date1] is before [date2]
  /// * 1 if [date1] is after [date2]
  num compare(DateTime date1, DateTime date2) {
    if (datePickerMode == "day" && truthy(compareHandlerDay)) {
      return compareHandlerDay(date1, date2);
    }
    if (datePickerMode == "month" && truthy(compareHandlerMonth)) {
      return compareHandlerMonth(date1, date2);
    }
    if (datePickerMode == "year" && truthy(compareHandlerMonth)) {
      return compareHandlerYear(date1, date2);
    }
    return null;
  }

  /// sets the view handler in dependence with the view type
  setRefreshViewHandler(Function handler, String type) {
    if (type == "day") {
      refreshViewHandlerDay = handler;
    }
    if (type == "month") {
      refreshViewHandlerMonth = handler;
    }
    if (type == "year") {
      refreshViewHandlerYear = handler;
    }
  }

  /// performs the view refresh
  refreshView() {
    if (datePickerMode == "day" && truthy(refreshViewHandlerDay)) {
      refreshViewHandlerDay();
    }
    if (datePickerMode == "month" && truthy(refreshViewHandlerMonth)) {
      refreshViewHandlerMonth();
    }
    if (datePickerMode == "year" && truthy(refreshViewHandlerYear)) {
      refreshViewHandlerYear();
    }
  }


  /// gets the part of the date in dependence of the format, ie: MMMM, DDD, yyy
  String dateFilter(DateTime date, String format) =>
      new DateFormat(format).format(date);

  ///  checks if date map is active
  bool isActive(dynamic dateObject) =>
      compare(dateObject['date'], activeDate) == 0;

  // todo: add dateObject['customClass'] = customClass({date: date, mode: datepickerMode}) || {};
  /// Creates a date map containing date, label, selected, disabled and current values
  Map createDateObject(DateTime date, String format) => {
    'date': date,
    'label': dateFilter(date, format),
    'selected': compare(date, activeDate) == 0,
    'disabled': isDisabled(date),
    'current': compare(date, new DateTime.now()) == 0
  };

  // todo: implement dateDisabled attribute
  /// returns `true` if [date] is before [minDate] or after [maxDate]
  bool isDisabled(DateTime date) =>
      minDate != null && compare(date, minDate) < 0
          || maxDate != null && compare(date, maxDate) > 0;

  /// splits the [arr] into a list of array of size [size]
  List split(List arr, num size) {
    var arrays = [];
    for (var i = 0; arr.length > i * size; i++) {
      arrays.add(arr.getRange(i * size, i * size + size).toList());
    }
    return arrays;
  }

  /// fired when user clicks one of the date buttons
  select(DateTime date) {
    if (datePickerMode == minMode) {
      if (activeDate == null) {
        activeDate = new DateTime(0);
      }
      activeDate = new DateTime(date.year, date.month, date.day);
    } else {
      activeDate = date;
      datePickerMode = modes[modes.indexOf(datePickerMode) - 1];
    }
    update.add(activeDate);
    refreshView();
  }

  /// selects the current day date
  selectToday() => select(new DateTime.now());

  /// changes the view values in dependence of the [direction]
  ///
  /// this is fired when users clicks on arrow buttons
  move(num direction) {
    var expectedStep = datePickerMode == "day" ? stepDay
        : datePickerMode == "month" ? stepMonth
        : datePickerMode == "year" ? stepYear
        : null;

    if (expectedStep != null) {
      var year = activeDate.year + direction * (expectedStep['years'] ?? 0);
      var month = activeDate.month + direction * (expectedStep['months'] ?? 0);
      activeDate = new DateTime(year, month, 1);
      update.add(activeDate);
      refreshView();
    }
  }

  /// toggles the view mode in dependence of the [direction]
  ///
  /// this is fired when users clicks on day, month, or year header buttons
  toggleMode([num direction]) {
    direction ??= 1;
    if ((datePickerMode == maxMode && direction == 1) ||
        (datePickerMode == minMode && direction == -1)) {
      return;
    }
    datePickerMode = modes[modes.indexOf(datePickerMode) + direction];
    refreshView();
  }
}