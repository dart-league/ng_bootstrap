import 'package:angular/angular.dart';
import 'package:ng_bootstrap/core/position.dart';
import 'dart:async';
import 'dart:html';
import 'package:stream_transform/stream_transform.dart';

@Component(
    selector: 'bs-tooltip',
    template: '''
<div class="tooltip-inner">
  <ng-content></ng-content>
</div>''',
    host: const {
      '[class.tooltip-top]': 'placement == "top"',
      '[class.tooltip-left]': 'placement == "left"',
      '[class.tooltip-right]': 'placement == "right"',
      '[class.tooltip-bottom]': 'placement == "bottom"'
    },
    directives: const [CORE_DIRECTIVES])
class BsTooltipComponent implements OnInit {
  ChangeDetectorRef cdr;

  /// Current element DOM reference
  HtmlElement elementRef;

  /// map of css classes values
  Map<String, dynamic> classMap = {};

  /// value in pixels of the top style
  @HostBinding('style.top')
  String top;

  /// value in pixels of the left style
  @HostBinding('style.left')
  String left;

  /// display style of the tooltip
  @HostBinding('style.display')
  String display = 'none';

  @Input()
  String placement = 'top';

  /// if `true` tooltip is currently visible
  bool isOpen;

  /// (*not implemented*) (`?string`) -
  /// custom tooltip class applied to the tooltip container.
  String popupClass;

  /// if `false` fade tooltip animation will be disabled
  @Input()
  @HostBinding('class.fade')
  bool animation = true;

  @Input('for')
  Element hostEl;

  /// String of event name which triggers tooltip opening
  @Input()
  String showEvent = 'mouseenter';

  /// String of event name which triggers tooltip opening
  @Input()
  String hideEvent = 'mouseleave';

  @HostBinding('class.show')
  bool classIn = false;

  bool _enable = true;

  Timer showTimer;

  Timer hideTimer;

  /// if `false` tooltip is disabled and will not be shown
  @Input()
  set enable(bool enable) {
    _enable = enable ?? true;
    if (!_enable) {
      hide();
    }
  }

  @Input()
  int popupDelay = 0;

  /// Constructs a new [BsTooltipComponent]
  /// injecting its [elementRef] and the [options]
  BsTooltipComponent(this.elementRef);

  /// positions its DOM element next to the parent in the desired position
  @override
  ngOnInit() {
    hostEl ??= elementRef.parent;
    hostEl.on[showEvent].listen((_) => show());
    hostEl.on[hideEvent].listen((_) => hide());
  }

  void show() {
    if (!_enable) return;

    display = 'block';
    hideTimer?.cancel();
    showTimer = new Timer(new Duration(milliseconds: popupDelay), () {
      var p = positionElements(
          hostEl, elementRef, placement, false);
      top = '${p.top}px';
      left = '${p.left}px';
      classIn = true;
    });
  }

  void hide() {
    showTimer?.cancel();
    hideTimer = new Timer(new Duration(milliseconds: 100), () {
      display = 'none';
      classIn = false;
    });
  }
}
