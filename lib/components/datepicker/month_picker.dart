part of bs_date_picker;

/// Creates a [BsMonthPickerComponent], this will be the view showed in the [NgBsDatePicker] when user clicks
/// month header button
@Component (selector: "bs-month-picker",
    templateUrl: 'month_picker.html',
    directives: const [coreDirectives],
    providers: [BsDatePickerComponent])
class BsMonthPickerComponent implements OnInit {
  /// parent [BsDatePickerInnerComponent]
  BsDatePickerComponent datePicker;

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
    datePicker.stepMonth = {"years" : 1};
    datePicker.setRefreshViewHandler(() {
      List months = new List(12);
      var initDate = datePicker._initDate;
      num year = initDate.year;
      var date;
      for (var i = 0; i < 12; i++) {
        date = new DateTime (year, i + 1, 1);
        months[i] = datePicker.createDateObject(date, datePicker.formatMonth);
      }
      dayTitle = datePicker.dateFilter(initDate, datePicker.formatDay);
      yearTitle = datePicker.dateFilter(initDate, datePicker.formatYear);
      rows = datePicker.split(months, 3);
    }, "month");
    datePicker.setCompareHandler((DateTime date1, DateTime date2) {
      var d1 = new DateTime (date1.year, date1.month);
      var d2 = new DateTime (date2.year, date2.month);
      return d1.millisecondsSinceEpoch - d2.millisecondsSinceEpoch;
    }, "month");
  }
}
