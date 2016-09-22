import "package:angular2/angular2.dart";
import 'package:ng_bootstrap/ng_bootstrap.dart';

@Component(selector: "tooltip-demo",
    templateUrl: 'tooltip_demo.html',
    directives: const [BS_DIRECTIVES],
    styles: const [
      '''
    /* Specify styling for tooltip contents */
    bs-tooltip.customClass /deep/ .tooltip-inner {
        color: #880000;
        background-color: #ffff66;
        box-shadow: 0 6px 12px rgba(0,0,0,.175);
    }
    /* Hide arrow */
    bs-tooltip.customClass /deep/ .tooltip-arrow {
        display: none;
    }
  '''
    ])
class TooltipDemo {
  String dynamicTooltip = "Hello, World!";
  String dynamicTooltipText = "dynamic";
  String htmlTooltip = "I've been made <b>bold</b>!";
  String inputModel;
}
