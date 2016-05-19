import "package:angular2/angular2.dart";

/// Create a group of buttons that behave like a set of checkboxes
///
/// Base specifications: [bootstrap 3](http://getbootstrap.com/javascript/#buttons) or [bootstrap 4](http://v4-alpha.getbootstrap.com/components/buttons/#checkbox-and-radio-buttons)
///
/// [demo](http://luisvt.github.io/ng2_strap/#buttons)
@Directive(
    selector: "n2s-btn-checkbox",
    host: const {"[class.active]" : "active"}
)
class N2sButtonCheckbox extends DefaultValueAccessor {
  N2sButtonCheckbox(this.ngModel, Renderer renderer, ElementRef elementRef) : super(renderer, elementRef) {
    ngModel.valueAccessor = this;
  }

  NgModel ngModel;

  /// if it is equals to the [ngModel] value then the checkbox is going to be active
  @Input() dynamic trueValue = true;

  /// if it is not equals to the [ngModel] value then the checkbox is not going to be active
  @Input() dynamic falseValue = false;

  var _value;

  /// active status of the button
  bool get active => trueValue == _value;

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
  onClick() {
    toggle(!active);
  }
}