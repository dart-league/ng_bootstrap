import 'package:angular/core.dart';
import 'package:angular_forms/angular_forms.dart';


/// A [Directive] that adds a pattern validator to any controls with `bsPattern`:
///
/// ```html
/// <input ngControl="fullName" bsPattern="[a-zA-Z ]*" />
/// ```
///
/// The attribute value is parsed and used as a [RegExp] to validate the control
/// value against. The regular expression must match the entire control value.
@Directive(
  selector: ''
      '[bsPattern][ngControl],'
      '[bsPattern][ngFormControl],'
      '[bsPattern][ngModel]',
  providers: const [
    const Provider(
      NG_VALIDATORS,
      useExisting: BsPatternValidator,
      multi: true,
    ),
  ],
)
class BsPatternValidator implements Validator {
  @Input() String bsPattern;

  @override
  Map<String, dynamic> validate(AbstractControl control) {
    if (Validators.required(control) != null) return null;
    if (bsPattern == null) return null;
    var regex = new RegExp('^$bsPattern\$');
    String v = control.value;
    return regex.hasMatch(v)
        ? null
        : {'pattern': {'requiredPattern': '^$bsPattern\$', 'actualValue': v}};
  }
}
