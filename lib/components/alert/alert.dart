import 'dart:async';
import 'dart:html';
import "package:angular/angular.dart";

/// Provide contextual feedback messages for typical user actions
/// with the handful of available and flexible alert messages.
@Component (
    selector: "bs-alert",
    styles: const [':host { display:block; }'],
    template: '''
    <button *ngIf="dismissible" type="button" class="close" (click)="close()">
        <span aria-hidden="true">&times;</span>
        <span class="sr-only">Close</span>
    </button>
    <ng-content></ng-content>
    ''',
    directives: const [coreDirectives])
class BsAlertComponent implements OnInit {
  /// provides the element reference to get native element
  HtmlElement _elementRef;

  ///  provide one of the four supported contextual classes:
  ///  `success`,`info`, `warning`, `danger`
  @Input() String type = 'warning';

  final _onCloseCtrl = new StreamController<BsAlertComponent>.broadcast();

  /// fired when `alert` closed with inline button or by timeout,
  /// `$event` is an instance of `Alert` component
  @Output('close')
  Stream<BsAlertComponent> get onClose => _onCloseCtrl.stream;

  /// number of milliseconds, if specified sets a timeout duration,
  /// after which the alert will be closed
  @Input() int timeout;

  @Input()
  @HostBinding('class.alert-dismissible')
  bool dismissible = false;

  @HostBinding('class.alert-success')
  bool get isSuccess => type == 'success';

  @HostBinding('class.alert-info')
  bool get isInfo => type == 'info';

  @HostBinding('class.alert-warning')
  bool get isWarning => type == 'warning';

  @HostBinding('class.alert')
  bool get isAlert => true;

  @HostBinding('class.alert-danger')
  bool get isDanger => type == 'danger';

  @HostBinding('attr.role')
  String get role => 'alert';

  bool get hasTimeout => timeout != null;

  BsAlertComponent(this._elementRef);

  ngOnInit() {
    if (hasTimeout) {
      new Timer(new Duration(milliseconds: timeout), close);
    }
  }

  close() {
    _onCloseCtrl.add(this);
    _elementRef.remove();
  }
}
