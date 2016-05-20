import 'dart:async';

import "package:angular2/angular2.dart";
import 'package:node_shims/js.dart';

/// Provide contextual feedback messages for typical user actions
/// with the handful of available and flexible alert messages.
@Component (selector: "ngbs-alert", templateUrl: 'alert.html')
class NgBsAlert implements OnInit {
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
  @Input() int dismissOnTimeout;

  /// variable to check if the alert is closed
  bool closed = false;

  /// css classes
  Set<String> classes = new Set();

  /// if `true` alert could be closed
  bool _closeable = false;

  NgBsAlert(this.elementRef) {
    _closeable = _closeable || elementRef.nativeElement.getAttribute("(close)") != null;
  }


  /// if `true` alert could be closed
  @Input() set closeable(bool v) {
    _closeable = v;
  }

  /// if `true` alert could be closed
  bool get closeable => _closeable;

  /// initialize attributes
  ngOnInit() {
    type ??= "warning";
    classes.add("alert-$type");
    if (_closeable) {
      classes.add("alert-dismissible");
    }
    if (truthy(dismissOnTimeout)) {
      closeable = true;
      new Timer(new Duration(milliseconds: dismissOnTimeout), onClose);
    }
  }

  /// listen when close button is pressed
  onClose() {
    // todo: mouse event + touch + pointer
    close.add(this);
    elementRef.nativeElement.remove();
    closed = true;
  }
}