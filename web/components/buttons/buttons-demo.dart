import "package:angular2/angular2.dart";
import "package:ng_bootstrap/buttons/button-checkbox.dart";
import 'package:ng_bootstrap/buttons/button-radio.dart';

@Component(
    selector: "buttons-demo",
    templateUrl: "buttons-demo.html",
    directives: const [
      NgBsButtonCheckbox,
      NgBsButtonRadio
    ])
class ButtonsDemo {
  String singleModel = "1";
  String radioModel = "Middle";
  Map checkModel = {"left": false, "middle": true, "right": false};
}
