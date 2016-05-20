import "package:angular2/angular2.dart";
import 'package:angular2/platform/browser.dart';
import "package:ng_bootstrap/ng_bootstrap.dart";

import 'components/alert/alert_demo.dart';
import 'components/buttons/buttons_demo.dart';
import 'components/carousel/carousel_demo.dart';
import 'components/collapse/collapse_demo.dart';
import "components/demo_header.dart";
import "components/demo_section.dart";
import 'components/dropdown/dropdown_demo.dart';
import 'components/pagination/pagination_demo.dart';
import 'components/progressbar/progressbar_demo.dart';
import 'components/tabs/tabs_demo.dart';
import 'components/tooltip/tooltip_demo.dart';

@Component(
    selector: "app",
    templateUrl: 'demo.html',
    directives: const [
      DemoHeader,
      DemoSection,
      AlertDemo,
      ButtonsDemo,
      CarouselDemo,
      CollapseDemo,
      DropdownDemo,
      PaginationDemo,
      ProgressbarDemo,
      TabsDemo,
      TooltipDemo
    ])
class Demo {}

main() {
  bootstrap(Demo);
}
