part of bs_date_picker;

String defaultFormat = 'yMMMd';
String _defaultLocale = 'en_US';

/// Creates an [NgBsDatePickerPopup], this is a date-picker component that is popup when user clicks
/// on the input box or on the button at the right of the input box.
@Component (selector: "bs-date-picker-popup",
    templateUrl: 'date_picker_popup.html',
    directives: const [
      bsDropdownDirectives,
      BsDatePickerComponent,
      BsToggleButtonDirective,
      coreDirectives,
      formDirectives
    ],
    pipes: const [commonPipes]
)
class BsDatePickerPopupComponent extends BsDatePickerBase {
  /// Constructs a DatePickerPopup
  BsDatePickerPopupComponent(this.ngModel, HtmlElement elementRef)
      : super(elementRef) {
    ngModel.valueAccessor = this;
  }

  /// provides access to entered value
  NgModel ngModel;

  /// if `true` shows the button bar at the bottom of the popup menu
  @Input() bool showButtonBar = true;

  /// provides the text that will be showed in the current-day button
  @Input() String currentText = 'Today';

  /// provides the text that will be showed in the clear button
  @Input() String clearText = 'Clear';

  /// provides the text that will be displayed in the close button
  @Input() String closeText = 'Close';

  /// if `true` the dropdown-menu will be open, and the date-picker visible
  bool isOpen;

  /// format pattern used to show the input value
  ///
  /// See [DateFormat] for more information.
  @Input() String format = defaultFormat;

  /// locale used to localize the output values
  @Input() String locale = _defaultLocale;

  valueChanged(value) {
    var df = new DateFormat(format, locale);
    try {
      ngModel.viewToModelUpdate(df.parse(value));
    } catch (e) {
      print(e);
    }
  }
}
