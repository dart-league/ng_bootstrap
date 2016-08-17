import 'dart:async';
import "package:angular2/angular2.dart";

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
    host: const {
      'class': 'alert',
      'role': 'alert'
    })
class Alert implements OnInit {
  /// provides the element reference to get native element
  ElementRef _elementRef;

  ///  provide one of the four supported contextual classes:
  ///  `success`,`info`, `warning`, `danger`
  @Input() String type = 'warning';

  /// fired when `alert` closed with inline button or by timeout,
  /// `$event` is an instance of `Alert` component
  @Output('close')
  EventEmitter onClose = new EventEmitter();

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

  @HostBinding('class.alert-danger')
  bool get isDanger => type == 'danger';

  bool get hasTimeout => timeout != null;

  Alert(this._elementRef);

  ngOnInit() {
    if (hasTimeout) {
      new Timer(new Duration(milliseconds: timeout), close);
    }
  }

  close() {
    onClose.add(this);
    _elementRef.nativeElement.remove();
  }
}
