import 'dart:html';
import "package:angular/angular.dart";
import 'package:angular_forms/angular_forms.dart';

@Directive(selector: "bs-radio-button")
class BsRadioButtonDirective extends DefaultValueAccessor {
  /// handles the selected value of the button
  NgModel ngModel;

  /// option to be selected
  @Input()
  var option;

  /// if `true` the button group can be unchecked
  @Input()
  bool uncheckable = true;

  /// provide the state of the button
  @HostBinding('class.active')
  bool get active => option == _value;

  var _value;

  BsRadioButtonDirective(this.ngModel, HtmlElement elementRef)
      : super(elementRef) {
    ngModel.valueAccessor = this;
  }

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
    } else {
      _value = option;
    }

    ngModel.viewToModelUpdate(_value);
  }
}
