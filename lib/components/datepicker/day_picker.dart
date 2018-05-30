part of bs_date_picker;

/// Creates an [BsDayPickerComponent], this will be the view showed in the [NgBsDatePicker] when user clicks
/// day header button
@Component(selector: "bs-day-picker", templateUrl: 'day_picker.html', directives: const [coreDirectives])
class BsDayPickerComponent {
  /// provides access to [BsDatePickerComponent] parent container
  BsDatePickerComponent datePicker;

  /// labels of the days week
  List<Map<String,String>> labels = [];

  /// provides the label that will appears in the month button of day view
  String monthTitle;

  /// provides the label that will appears in the year button of day view
  String yearTitle;

  /// provides the rows of days that will be displayed
  List<List<DisplayedDate>> rows = List<List<DisplayedDate>>();

  /// provides the values of the week numbers column
  List<num> weekNumbers = [];

  /// provides the maximun mode that can be displayed
  String maxMode = 'year';

  ///
  List<DateTime> getDates(DateTime startDate, num n) {
    List<DateTime> dates = new List(n);
    var current = startDate;
    var i = 0;
    var date;
    while (i < n) {
      date = current;
      dates[i++] = date;
      current = current.add(const Duration(days: 1));
    }
    return dates;
  }

  ///
  num getISO8601WeekNumber(DateTime checkDate) {
    // ISO week date weeks start on monday
    // so correct the day number
    var dayNr = (checkDate.weekday + 6) % 7;

    // ISO 8601 states that week 1 is the week
    // with the first thursday of that year.
    // Set the target date to the thursday in the target week
    var thisMonday = checkDate.subtract(new Duration(days: (dayNr)));
    var thisThursday = thisMonday.add(new Duration(days: 3));

    // Set the target to the first thursday of the year
    // First set the target to january first
    var firstThursday = new DateTime(checkDate.year, DateTime.january, 1);

    if (firstThursday.weekday != (DateTime.thursday)) {
      firstThursday = new DateTime(checkDate.year, DateTime.january, 1 + ((4 - firstThursday.weekday) + 7) % 7);
    }

    // The weeknumber is the number of weeks between the
    // first thursday of the year and the thursday in the target week
    return (thisThursday.difference(firstThursday).inDays / 7).ceil();
  }

  void refreshViewHandler() {
    DateTime initDate = datePicker._initDate;
    num year = initDate.year;
    num month = initDate.month;
    DateTime firstDayOfMonth = new DateTime(year, month, 1 - new DateTime(year, month, 1, 12).weekday, 12);
    num difference = datePicker.startingDay - firstDayOfMonth.day;
    num numDisplayedFromPreviousMonth = (difference > 0) ? 7 - difference : -difference;
    DateTime firstDate = firstDayOfMonth;
    if (numDisplayedFromPreviousMonth > 0) {
      //todo luisvt: not sure what to do with next line
//        firstDate.setDate(-numDisplayedFromPreviousMonth + 1);
    }
    // 42 is the number of days on a six-week calendar
    List<DateTime> _days = getDates(firstDate, 42);
    List<DisplayedDate> days = List();
    for (num i = 0; i < 42; i++) {
      DisplayedDate _dateObject = datePicker.createDateObject(_days[i], datePicker.formatDay);
      _dateObject.secondary = _days[i].month != month;
      days.add(_dateObject);
    }
    labels = [];
    for (num j = 0; j < 7; j++) {
      labels.add({
        'abbr': datePicker.dateFilter(days[j].date, datePicker.formatDayHeader),
        'full': datePicker.dateFilter(days[j].date, "EEEE")
      });
    }
    monthTitle = new DateFormat(datePicker.formatMonthTitle).format(initDate);
    yearTitle = new DateFormat(datePicker.formatYear).format(initDate);
    rows = datePicker.split(days, 7);
    if (datePicker.showWeeks) {
      weekNumbers.clear();
      num thursdayIndex = (4 + 7 - datePicker.startingDay) % 7, numWeeks = rows.length;
      for (num curWeek = 0; curWeek < numWeeks; curWeek++) {
        weekNumbers.add(getISO8601WeekNumber(rows[curWeek][thursdayIndex].date) + 1);
      }
    }
  }
}
