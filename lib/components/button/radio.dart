import "package:angular2/angular2.dart";

@Directive(selector: "bs-radio-button",
    host: const {"[class.active]" : "active"})
class RadioButton extends DefaultValueAccessor {
  RadioButton(this.ngModel, Renderer renderer, ElementRef elementRef)
      : super (renderer, elementRef) {
    ngModel.valueAccessor = this;
  }

  /// handles the selected value of the button
  NgModel ngModel;

  /// option to be selected
  @Input() var option;

  /// if `true` the button group can be unchecked
  @Input() bool uncheckable = true;

  /// provide the state of the button
  bool get active => option == _value;

  var _value;

  /// listen when the value of the button has changed
  @override
  writeValue(value) async {
      _value = value;
      super.writeValue(value);
  }

  /// listen on the click event of the button
  @HostListener('click')
  onClick() {
    if (uncheckable != false && option == _value) {
      _value = null;
      return;
    }
    _value = option;

    ngModel.viewToModelUpdate(_value);
  }
}