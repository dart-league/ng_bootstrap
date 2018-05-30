part of bs_date_picker;

/// Creates an [BsYearPickerComponent], this will be the view showed in the [NgBsDatePicker] when user clicks
/// year header button
@Component (selector: "bs-year-picker",
    templateUrl: 'year_picker.html',
    directives: const [coreDirectives],
    providers: const [BsDatePickerComponent])
class BsYearPickerComponent {
  /// container of the date-picker
  BsDatePickerComponent datePicker;

  /// label that appears in the day button which selects the day-picker
  String dayTitle;

  /// label that appears in the month button which selects the month-picker
  String monthTitle;

  /// rows of the years that will appears in the year-picker
  List<List<DisplayedDate>> rows = List<List<DisplayedDate>>();

  /// gets the value of the starting year of the viewed group
  int getStartingYear(num year) =>
      ((year - 1) ~/ datePicker.yearRange) * datePicker.yearRange + 1;

  refreshViewHandler() {
    List<DisplayedDate> years = new List(datePicker.yearRange);
    DateTime date;
    DateTime initDate = datePicker._initDate;
    for (var i = 0, start = getStartingYear(initDate.year); i <
        datePicker.yearRange; i ++) {
      date = new DateTime (start + i, 0, 1);
      years[i] = datePicker.createDateObject(date, datePicker.formatYear);
    }
    dayTitle = datePicker.dateFilter(initDate, datePicker.formatDay);

    monthTitle =
        datePicker.dateFilter(initDate, datePicker.formatMonth);

    rows = datePicker.split(years, 5);
  }
}
