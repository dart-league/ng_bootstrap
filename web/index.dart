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
import 'components/typeahead/typeahead_demo.dart';

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
      TooltipDemo,
      TypeaheadDemo
    ])
class Demo implements OnInit {
  bool isBs3 = Ng2BootstrapConfig.theme == Ng2BootstrapTheme.BS3;

  ViewContainerRef viewRef;

  Demo(@Inject(ViewContainerRef) this.viewRef);
  @override
  ngOnInit() {
//    HttpRequest.getString('./getting-started.md').then((result) {
//      (viewRef.element.nativeElement as Element).querySelector('#getting-started').innerHtml = markdownToHtml(result);
//    });
  }
}

main() {
//var gettingStarted = require("./getting-started.md");
//  var w = window;
//  if (w && identical(w.___theme, "bs4")) {
//    Ng2BootstrapConfig.theme = Ng2BootstrapTheme.BS4;
//  }
  bootstrap(Demo);
}
