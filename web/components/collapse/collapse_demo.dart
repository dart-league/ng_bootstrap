import "package:angular2/angular2.dart";
import 'package:ng_bootstrap/components.dart';


@Component(
    selector: "collapse-demo",
    templateUrl: 'collapse_demo.html',
    directives: const [Collapse])
class CollapseDemo {
  bool isCollapsed = false;
}
