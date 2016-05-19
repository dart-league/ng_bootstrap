import 'dart:async';

import "package:angular2/angular2.dart";
import 'package:node_shims/js.dart';

/// Provides contextual feedback messages for typical user actions with the handful of available and
/// flexible alert messages.
///
/// Base specifications: [bootstrap 3](http://getbootstrap.com/components/#alerts) or
/// [bootstrap 4](http://v4-alpha.getbootstrap.com/components/alerts/)
///
/// This directive can be used to generate alerts from the dynamic model data
/// (using the `ngFor` directive).
///
/// [demo](http://luisvt.github.io/ng2_strap/#alert)
@Component (selector: "n2s-alert",
    templateUrl: 'alert.html')
class N2sAlert implements OnInit {
  /// Constructs a new [N2sAlert] injecting the current [elementRef]
  N2sAlert(this.elementRef) {
    _closeable = _closeable || elementRef.nativeElement.getAttribute("(close)") != null;
  }

  /// provides the element reference to get native element
  ElementRef elementRef;

  ///  provide one of the four supported contextual classes:
  ///  `success`,`info`, `warning`, `danger`
  @Input() String type;

  /// fired when `alert` closed with inline button or by timeout, `$event` is an instance of `Alert` component
  @Output() EventEmitter close = new EventEmitter ();

  /// number of milliseconds, if specified sets a timeout duration, after which the alert will be closed
  @Input() int dismissOnTimeout;

  /// variable to check if the alert is closed
  bool closed = false;

  /// css classes
  Set<String> classes = new Set();

  /// if `true` alert could be closed
  bool _closeable = false;

  /// if `true` alert could be closed
  @Input() set closeable(bool v) {
    _closeable = v;
  }

  /// if `true` alert could be closed
  bool get closeable {
    return _closeable;
  }

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
  // todo: mouse event + touch + pointer
  onClose() {
    close.add(this);
    elementRef.nativeElement.remove();
    closed = true;
  }
}