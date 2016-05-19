import "package:angular2/angular2.dart";
import "package:ng_bootstrap/buttons/button_checkbox.dart";
import 'package:ng_bootstrap/buttons/button_radio.dart';

@Component(
    selector: "buttons-demo",
    templateUrl: "buttons_demo.html",
    directives: const [
      NgBsButtonCheckbox,
      NgBsButtonRadio
    ])
class ButtonsDemo {
  String singleModel = "1";
  String radioModel = "Middle";
  Map checkModel = {"left": false, "middle": true, "right": false};
}
