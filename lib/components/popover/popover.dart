import 'package:angular/angular.dart';
import 'package:ng_bootstrap/components/tooltip/tooltip.dart';
import 'dart:html';

@Component(
    selector: 'bs-popover',
    template: '''
<div class="arrow"></div>
<h3 class="popover-header">
  {{heading}}
  <ng-content select="header"></ng-content>
</h3>
<div class="popover-body">
  <ng-content></ng-content>
</div>''',
    directives: const [coreDirectives])
class BsPopoverComponent extends BsTooltipComponent {
  /// Header of the popover
  @Input() String heading;

  @HostBinding("class.bs-popover-top")
  bool get bsTooltipTop => placement == "top";

  @HostBinding("class.bs-popover-left")
  bool get bsTooltipLeft => placement == "left";

  @HostBinding("class.bs-popover-right")
  bool get bsTooltipRight => placement == "right";

  @HostBinding("class.bs-popover-bottom")
  bool get bsTooltipBottom => placement == "bottom";

  /// Constructs a new [BspopoverComponent]
  /// injecting its [elementRef] and the [options]
  BsPopoverComponent(HtmlElement elementRef) : super(elementRef) {
    showEvent = 'focus';
    hideEvent = 'blur';
  }
}
