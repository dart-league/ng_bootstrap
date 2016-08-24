import "package:angular2/angular2.dart";
import 'package:ng_bootstrap/components/collapse/collapse.dart';


@Component(
    selector: "collapse-demo",
    templateUrl: 'collapse_demo.html',
    directives: const [BsCollapseDirective])
class CollapseDemo {
  bool isCollapsed = false;
}
