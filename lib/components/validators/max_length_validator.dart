import 'package:angular2/angular2.dart';
import 'package:angular2/core.dart';

/// A [Directive] adding minimum-length validator to controls with `minlength`.
///
/// ```html
/// <input ngControl="fullName" minLength="10" />
/// ```
@Directive(
  selector: ''
      '[maxLength][ngControl],'
      '[maxLength][ngFormControl],'
      '[maxLength][ngModel]',
  providers: const [
    const Provider(
      NG_VALIDATORS,
      useExisting: BsMaxLengthValidator,
      multi: true,
    ),
  ],
)
class BsMaxLengthValidator implements Validator {
  @Input() int maxLength;

  @override
  Map<String, dynamic> validate(AbstractControl control) {
    if (Validators.required(control) != null) return null;
    String v = control.value;
    return maxLength != null && v.length > maxLength
        ? {'maxLength': {'requiredLength': maxLength, 'actualLength': v.length}}
        : null;
  }
}
