part of n2s_date_picker;

/// Creates an [N2sDatePickerPopup], this is a date-picker component that is popup when user clicks
/// on the input box or on the button at the right of the input box.
@Component (selector: "n2s-date-picker-popup",
    templateUrl: 'date_picker_popup.html',
    directives: const [N2S_DROPDOWN_DIRECTIVES, N2sDatePicker, N2sButtonCheckbox]
)
class N2sDatePickerPopup extends DefaultValueAccessor {
  ///
  N2sDatePickerPopup(this.ngModel, Renderer renderer, ElementRef elementRef)
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

  /// writes the value from the view
  void writeValue(dynamic value) {
    if (value != null) {
      if (value is String) {
        value = DateTime.parse(value);
      }
    }
  }

  /// updates the value to the view, is fired when active date changes
  void update() {
    ngModel.viewToModelUpdate(ngModel.model);
  }
}