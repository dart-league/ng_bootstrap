part of n2s_date_picker;

/// Creates an [NgBsDatePickerPopup], this is a date-picker component that is popup when user clicks
/// on the input box or on the button at the right of the input box.
@Component (selector: "bs-date-picker-popup",
    templateUrl: 'date_picker_popup.html',
    directives: const [NG_BOOTSTRAP_DROPDOWN_DIRECTIVES, DatePicker, ToggleButton]
)
class DatePickerPopup extends DefaultValueAccessor {
  /// Constructs a DatePickerPopup
  DatePickerPopup(this.ngModel, Renderer renderer, ElementRef elementRef)
      : super(renderer, elementRef) {
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

  /// updates the value to the view, is fired when active date changes
  void update() {
    ngModel.viewToModelUpdate(ngModel.model);
  }
}