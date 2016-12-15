part of bs_date_picker;

/// Creates an [BsDayPickerComponent], this will be the view showed in the [NgBsDatePicker] when user clicks
/// day header button
@Component (selector: "bs-day-picker",
    templateUrl: 'day_picker.html')
class BsDayPickerComponent implements OnInit {
  /// Constructs an [BsDayPickerComponent] injecting [datePickerInner]
  BsDayPickerComponent(this.datePickerInner);

  /// provides access to [BsDatePickerInnerComponent] parent container
  BsDatePickerInnerComponent datePickerInner;

  /// labels of the days week
  List labels = [];

  /// provides the label that will appears in the month button of day view
  String monthTitle;

  /// provides the label that will appears in the year button of day view
  String yearTitle;

  /// provides the rows of days that will be displayed
  List rows = [];

  /// provides the values of the week numbers column
  List<num> weekNumbers = [];

  /// provides the maximun mode that can be displayed
  String maxMode = 'year';

  ///
  getDates(DateTime startDate, num n) {
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
    var thisMonday = checkDate.subtract(new Duration(days:(dayNr)));
    var thisThursday = thisMonday.add(new Duration(days:3));

    // Set the target to the first thursday of the year
    // First set the target to january first
    var firstThursday = new DateTime(checkDate.year, DateTime.JANUARY, 1);

    if(firstThursday.weekday != (DateTime.THURSDAY)) {
      firstThursday = new DateTime(checkDate.year, DateTime.JANUARY, 1 + ((4 - firstThursday.weekday) + 7) % 7);
    }

    // The weeknumber is the number of weeks between the
    // first thursday of the year and the thursday in the target week
    return (thisThursday.difference(firstThursday).inDays / 7).ceil();
  }

  ///
  ngOnInit() {
    datePickerInner.stepDay = { "months" : 1};
    datePickerInner.setRefreshViewHandler(() {
      var year = datePickerInner.activeDate.year;
      var month = datePickerInner.activeDate.month;
      var firstDayOfMonth = new DateTime (year, month, 1 - new DateTime(year, month, 1, 12).weekday, 12);
      var difference = datePickerInner.startingDay - firstDayOfMonth.day;
      var numDisplayedFromPreviousMonth = (difference > 0)
          ? 7 - difference
          : -difference;
      var firstDate = firstDayOfMonth;
      if (numDisplayedFromPreviousMonth > 0) {
        //todo luisvt: not sure what to do with next line
//        firstDate.setDate(-numDisplayedFromPreviousMonth + 1);
      }
      // 42 is the number of days on a six-week calendar
      List<DateTime> _days = getDates(firstDate, 42);
      List days = [];
      for (var i = 0; i < 42; i++) {
        var _dateObject = datePickerInner.createDateObject(_days[i], datePickerInner.formatDay);
        _dateObject['secondary'] = _days[i].month != month;
        days.add(_dateObject);
      }
      labels = [];
      for (var j = 0; j < 7; j ++) {
        labels.add({
          'abbr': datePickerInner.dateFilter(days[j]['date'], datePickerInner.formatDayHeader),
          'full': datePickerInner.dateFilter(days[j]['date'], "EEEE")
        });
      }
      monthTitle = new DateFormat(datePickerInner.formatMonthTitle).format(datePickerInner.activeDate);
      yearTitle = new DateFormat(datePickerInner.formatYear).format(datePickerInner.activeDate);
      rows = datePickerInner.split(days, 7);
      if (datePickerInner.showWeeks) {
        weekNumbers.clear();
        var thursdayIndex = (4 + 7 - datePickerInner.startingDay) % 7,
            numWeeks = rows.length;
        for (var curWeek = 0; curWeek < numWeeks; curWeek ++) {
          weekNumbers.add(getISO8601WeekNumber(rows[curWeek][thursdayIndex]['date']) + 1);
        }
      }
    }, "day");
    datePickerInner.setCompareHandler((date1, date2) {
      var d1 = new DateTime (date1.year, date1.month, date1.day);
      var d2 = new DateTime (date2.year, date2.month, date2.day);
      return d1.millisecondsSinceEpoch - d2.millisecondsSinceEpoch;
    }, "day");
    datePickerInner.refreshView();
  }
}