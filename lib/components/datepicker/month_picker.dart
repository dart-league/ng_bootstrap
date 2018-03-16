part of bs_date_picker;

/// Creates a [BsMonthPickerComponent], this will be the view showed in the [NgBsDatePicker] when user clicks
/// month header button
@Component (selector: "bs-month-picker",
    templateUrl: 'month_picker.html',
    directives: const [coreDirectives],
    providers: const [BsDatePickerComponent])
class BsMonthPickerComponent {
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

  void refreshViewHandler() {
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
  }
}
