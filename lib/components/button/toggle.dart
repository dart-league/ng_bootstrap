import "package:angular2/angular2.dart";

@Directive(
    selector: "bs-toggle-button",
    host: const {"[class.active]": "active"})
class BsToggleButtonDirective extends DefaultValueAccessor {
  NgModel ngModel;

  /// if it is equals to the [ngModel] value then the checkbox is going to be active
  @Input()
  dynamic trueValue = true;

  /// if it is not equals to the [ngModel] value then the checkbox is not going to be active
  @Input()
  dynamic falseValue = false;

  var _value;

  /// active status of the button
  bool get active => trueValue == _value;

  BsToggleButtonDirective(this.ngModel, Renderer renderer, ElementRef elementRef)
      : super(renderer, elementRef) {
    ngModel.valueAccessor = this;
  }

  /// this function is fired whenever a new write is done to the [ngModel]
  writeValue(value) async {
    _value = value;
    super.writeValue(_value);
  }

  /// toggles the state of the [active] attribute
  toggle(bool checked) {
    _value = checked ? trueValue : falseValue;
    ngModel.viewToModelUpdate(_value);
  }

  /// Listens on the click event of the button
  @HostListener('click')
  onClick() => toggle(!active);
}
