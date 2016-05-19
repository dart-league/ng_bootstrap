part of n2s_date_picker;

//
//const TEMPLATE_OPTIONS = const { "bs4" : { "YEAR_BUTTON" : '''
//        <button type="button" style="min-width:100%;" class="btn btn-default"
//                [ngClass]="{\'btn-info\': dtz.selected, \'btn-link\': !dtz.selected && !datePicker.isActive(dtz), \'btn-info\': !dtz.selected && datePicker.isActive(dtz), disabled: dtz.disabled}"
//                [disabled]="dtz.disabled"
//                (click)="datePicker.select(dtz.date)" tabindex="-1">
//          <span [ngClass]="{\'text-success\': dtz.current}">{{dtz.label}}</span>
//        </button>
//    '''}, "bs3" : { "YEAR_BUTTON" : '''
//        <button type="button" style="min-width:100%;" class="btn btn-default"
//                [ngClass]="{\'btn-info\': dtz.selected, active: datePicker.isActive(dtz), disabled: dtz.disabled}"
//                [disabled]="dtz.disabled"
//                (click)="datePicker.select(dtz.date)" tabindex="-1">
//          <span [ngClass]="{\'text-info\': dtz.current}">{{dtz.label}}</span>
//        </button>
//    '''}};
//
//final CURRENT_THEME_TEMPLATE = TEMPLATE_OPTIONS [ Ng2BootstrapConfig.theme ] ||
//    TEMPLATE_OPTIONS.bs3;

/// Creates an [N2sYearPicker], this will be the view showed in the [N2sDatePicker] when user clicks
/// year header button
@Component (selector: "n2s-year-picker",
    templateUrl: 'year_picker.html')
class N2sYearPicker implements OnInit {
  /// Constructs a [N2sYearPicker] injecting the parent [datePickerInner]
  N2sYearPicker(this.datePickerInner);

  /// container of the date-picker
  N2sDatePickerInner datePickerInner;

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