part of n2s_date_picker;

/// Creates an [NgBsYearPicker], this will be the view showed in the [NgBsDatePicker] when user clicks
/// year header button
@Component (selector: "bs-year-picker",
    templateUrl: 'year_picker.html')
class NgBsYearPicker implements OnInit {
  /// Constructs a [NgBsYearPicker] injecting the parent [datePickerInner]
  NgBsYearPicker(this.datePickerInner);

  /// container of the date-picker
  NgBsDatePickerInner datePickerInner;

  /// label that appears in the day button which selects the day-picker
  String dayTitle;

  /// label that appears in the month button which selects the month-picker
  String monthTitle;

  /// rows of the years that will appears in the year-picker
  List rows = [];

  /// gets the value of the starting year of the viewed group
  int getStartingYear(num year) =>
      ((year - 1) ~/ datePickerInner.yearRange) * datePickerInner.yearRange + 1;

  /// initialize the attributes
  ngOnInit() {
    datePickerInner.stepYear = { "years" : datePickerInner.yearRange};
    datePickerInner.setRefreshViewHandler(() {
      List years = new List(datePickerInner.yearRange);
      var date;
      for (var i = 0, start = getStartingYear(datePickerInner.activeDate.year); i <
          datePickerInner.yearRange; i ++) {
        date = new DateTime (start + i, 0, 1);
        years[i] = datePickerInner.createDateObject(date, datePickerInner.formatYear);
      }
      dayTitle = datePickerInner.dateFilter(datePickerInner.activeDate, datePickerInner.formatDay);

      monthTitle =
          datePickerInner.dateFilter(datePickerInner.activeDate, datePickerInner.formatMonth);

      rows = datePickerInner.split(years, 5);
    }, "year");
    datePickerInner.setCompareHandler((DateTime date1, DateTime date2) => date1.year - date2.year,
        "year");
    datePickerInner.refreshView();
  }
}