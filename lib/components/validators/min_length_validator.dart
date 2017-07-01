import 'package:angular2/angular2.dart';
import 'package:angular2/core.dart';

/// A [Directive] adding minimum-length validator to controls with `minlength`.
///
/// ```html
/// <input ngControl="fullName" minLength="10" />
/// ```
@Directive(
  selector: ''
      '[minLength][ngControl],'
      '[minLength][ngFormControl],'
      '[minLength][ngModel]',
  providers: const [
    const Provider(
      NG_VALIDATORS,
      useExisting: BsMinLengthValidator,
      multi: true,
    ),
  ],
)
class BsMinLengthValidator implements Validator {
  @Input() int minLength;

  @override
  Map<String, dynamic> validate(AbstractControl control) {
    if (Validators.required(control) != null) return null;
    String v = control.value;
    return minLength != null && v.length < minLength
        ? {'minLength': {'requiredLength': minLength, 'actualLength': v.length}}
        : null;
  }
}
