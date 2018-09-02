import 'package:angular/angular.dart';
import 'package:angular/core.dart';
import 'package:angular_forms/angular_forms.dart';

/// Provides an easy way to create an input element with built-in validation
@Component(
    selector: 'bs-input',
    templateUrl: 'input.html',
    directives: const [coreDirectives, formDirectives],
    providers: const [const ExistingProvider.forToken(ngValueAccessor, BsInput),formDirectives]
)
class BsInput extends DefaultValueAccessor implements OnInit {
  BsInput() : super(null);

  /// handles the id that the internal input-box and label elements should have.
  /// This is needed if we want the users click into the label and the input-box
  /// get focused.
  @Input() String eId;

  /// Label that the input-box will have
  @Input() String label;

  /// Validates if the value is [required].
  @Input() bool required = false;

  /// Message used when [required] fails
  @Input() String requiredMessage;

  /// Validates if the value is lower than the [minlength].
  @Input() int minlength = 0;


  /// Message used when [minLengthMessage] fails
  @Input() String minLengthMessage;

  /// Validates if the value is greater than the [maxlength].
  @Input() int maxlength = 9999;

  /// Message usedbsPattern when [maxLength] fails
  @Input() String maxLengthMessage;

  /// Validates if the value matches the [pattern]
  @Input() String pattern;

  /// Message used when [pattern] fails
  @Input() String patternMessage;

  /// Text shown in the input box when the user has not been put any value.
  @Input() String placeholder;

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

  @override
  void ngOnInit() {
  }


}
