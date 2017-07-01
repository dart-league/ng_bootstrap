import 'package:angular2/angular2.dart';
import 'package:angular2/core.dart';
import 'package:ng_bootstrap/components/validators/max_length_validator.dart';
import 'package:ng_bootstrap/components/validators/min_length_validator.dart';

@Component(
    selector: 'bs-input',
    templateUrl: 'input.html',
    directives: const [BsMinLengthValidator, BsMaxLengthValidator],
    providers: const [const Provider(NG_VALUE_ACCESSOR, useExisting: BsInput, multi: true)]
)
class BsInput extends DefaultValueAccessor {
  BsInput() : super(null);

  @Input() String eId;
  @Input() String label;
  @Input() bool required;
  @Input() int minLength;
  @Input() int maxLength;
  @Input() String placeholder;
  @Input() String ngControl;

  var _value;

  get value => _value;

  void set value(value) {
    if (value != _value) {
      _value = value;
      onChange(_value);
    }
  }

  @override
  void writeValue(value) {
    if (value != _value) {
      _value = value;
    }
  }
}
