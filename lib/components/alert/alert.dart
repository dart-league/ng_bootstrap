import 'dart:async';
import "package:angular2/angular2.dart";
///import 'package:node_shims/js.dart';

/// Provide contextual feedback messages for typical user actions
/// with the handful of available and flexible alert messages.
@Component (
    selector: "bs-alert",
    templateUrl: 'alert.html',
    styles: const [':host { display:block; }'],
    template: '''
    <button *ngIf="dismissible" type="button" class="close" (click)="onClose()">
        <span aria-hidden="true">&times;</span>
        <span class="sr-only">Close</span>
    </button>
    <ng-content></ng-content>
    ''',
    host: const {
      'class': 'alert',
      'role': 'alert',
      '[class.alert-success]': 'isType("success")',
      '[class.alert-info]': 'isType("info")',
      '[class.alert-warning]': 'isType("warning") || isType(null)',
      '[class.alert-danger]': 'isType("danger")',
    })
class Alert implements OnInit {
  /// provides the element reference to get native element
  ElementRef elementRef;

  ///  provide one of the four supported contextual classes:
  ///  `success`,`info`, `warning`, `danger`
  @Input() String type;

  /// fired when `alert` closed with inline button or by timeout,
  /// `$event` is an instance of `Alert` component
  @Output() EventEmitter close = new EventEmitter ();

  /// number of milliseconds, if specified sets a timeout duration,
  /// after which the alert will be closed
  @Input() int timeout;

  @Input()
  @HostBinding('[class.alert-dismissible]')
  bool dismissible = false;

  Alert(this.elementRef);

  bool get hasTimeout => timeout != null;

  bool isType(String type) => this.type == type;

  ngOnInit() {
    if (hasTimeout) {
      new Timer(new Duration(milliseconds: timeout), onClose);
    }
  }

  onClose() {
    // todo: mouse event + touch + pointer
    close.add(this);
    elementRef.nativeElement.remove();
  }
}
