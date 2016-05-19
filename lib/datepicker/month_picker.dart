part of n2s_date_picker;

/// Creates a [NgBsMonthPicker], this will be the view showed in the [NgBsDatePicker] when user clicks
/// month header button
@Component (selector: "ngbs-month-picker",
    templateUrl: 'month_picker.html')
class NgBsMonthPicker implements OnInit {

  /// Constructs a [NgBsMonthPicker] injecting [datePickerInner]
  NgBsMonthPicker(this.datePickerInner);

  /// parent [NgBsDatePickerInner]
  NgBsDatePickerInner datePickerInner;

  /// label that appears in the year button header
  String yearTitle;

  /// label that appears in the day button header
  String dayTitle;

  /// rows that will be displayed in the month view
  List rows = [];

  /// provides the maximum mode
  String maxMode = 'year';

  /// initialize the attributes
  ngOnInit() {
    datePickerInner.stepMonth = {"years" : 1};
    datePickerInner.setRefreshViewHandler(() {
      List months = new List(12);
      num year = datePickerInner.activeDate.year;
      var date;
      for (var i = 0; i < 12; i++) {
        date = new DateTime (year, i + 1, 1);
        months[i] = datePickerInner.createDateObject(date, datePickerInner.formatMonth);
      }
      dayTitle = datePickerInner.dateFilter(datePickerInner.activeDate, datePickerInner.formatDay);
      yearTitle = datePickerInner.dateFilter(datePickerInner.activeDate, datePickerInner.formatYear);
      rows = datePickerInner.split(months, 3);
    }, "month");
    datePickerInner.setCompareHandler((DateTime date1, DateTime date2) {
      var d1 = new DateTime (date1.year, date1.month);
      var d2 = new DateTime (date2.year, date2.month);
      return d1.millisecondsSinceEpoch - d2.millisecondsSinceEpoch;
    }, "month");
    datePickerInner.refreshView();
  }
}