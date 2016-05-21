import 'package:angular2/angular2.dart';

/// Creates a progress component with multiple bars
///
/// Base specifications: [bootstrap 3](http://getbootstrap.com/components/#progress) or
/// [bootstrap 4](http://v4-alpha.getbootstrap.com/components/progress/)
///
/// [demo](http://luisvt.github.io/ng2_strap/#progress)
@Component(selector: 'bs-progress',
    template: '''
    <progress [max]="max" [value]="value"></progress>
    <label id="label"><ng-content></ng-content></label>
    ''',
    host: const {
      // todo: it looks there is a bug with ngClass and ngContent together, next 4 lines should be deleted if solved
      '[class.success]': 'type == "success"',
      '[class.info]': 'type == "info"',
      '[class.warning]': 'type == "warning"',
      '[class.danger]': 'type == "danger"'
    })
class Progress implements OnInit {

  /// if `true` changing `value` of progress bar will be animated (*note*: not supported by Bootstrap 4)
  @Input() bool animate = true;

  /// maximum value of the bar
  @Input() num max;

  /// value of the progress bar
  @Input() num value;

  // todo: it looks there is a bug with ngClass and ngContent together, next line should be deleted if solved
  @Input() String type;

  /// initialize the attributes
  ngOnInit() {
    animate ??= true;
    max = max ??= 100;
  }
}
