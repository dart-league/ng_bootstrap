import "package:angular2/angular2.dart";
import 'package:ng_bootstrap/ng_bootstrap.dart';

@Component(
    selector: "buttons-demo",
    templateUrl: "buttons_demo.html",
    directives: const [BS_DIRECTIVES])
class ButtonsDemo {
  String singleModel = "1";
  String radioModel = "Middle";
  Map checkModel = {"left": false, "middle": true, "right": false};
}
