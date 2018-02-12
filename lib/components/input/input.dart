import 'package:angular/angular.dart';
import 'package:angular/core.dart';
import 'package:ng_bootstrap/components/validators/max_length_validator.dart';
import 'package:ng_bootstrap/components/validators/min_length_validator.dart';
import 'package:ng_bootstrap/components/validators/pattern_validator.dart';
import 'package:angular_forms/angular_forms.dart';

/// Provides an easy way to create an input element with built-in validation
@Component(
    selector: 'bs-input',
    templateUrl: 'input.html',
    directives: const [BsMinLengthValidator, BsMaxLengthValidator, BsPatternValidator, CORE_DIRECTIVES, formDirectives],
    providers: const [const Provider(NG_VALUE_ACCESSOR, useExisting: BsInput, multi: true)]
)
class BsInput extends DefaultValueAccessor {
  BsInput() : super(null);

  /// handles the id that the internal input-box and label elements should have.
  /// This is needed if we want the users click into the label and the input-box
  /// get focused.
  @Input() String eId;

  /// Label that the input-box will have
  @Input() String label;

  /// Validates if the value is [required].
  @Input() bool required;

  /// Message used when [required] fails
  @Input() String requiredMessage;

  /// Validates if the value is lower than the [minLength].
  @Input() int minLength;


  /// Message used when [minLengthMessage] fails
  @Input() String minLengthMessage;

  /// Validates if the value is greater than the [maxLength].
  @Input() int maxLength;

  /// Message usedbsPattern when [maxLength] fails
  @Input() String maxLengthMessage;

  /// Validates if the value matches the [bsPattern]
  @Input() String bsPattern;

  /// Message used when [bsPattern] fails
  @Input() String bsPatternMessage;

  /// Text shown in the input box when the user has not been put any value.
  @Input() String placeholder;

  /// Name of the Validation Control
  @Input() String ngControl;

  var _value;

  /// Gets the value of the element
  get value => _value;

  /// Sets the value of the element
  void set value(value) {
    if (value != _value) {
      _value = value;
      onChange(_value);
    }
  }

  /// writes the value of the element into the view
  @override
  void writeValue(value) {
    if (value != _value) {
      _value = value;
    }
  }

  @HostListener('input', const ['\$event'])
  bool onInput($event) => true;
}
