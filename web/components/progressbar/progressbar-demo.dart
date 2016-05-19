import "package:angular2/angular2.dart";
import "package:ng2_strap/progressbar/progressbar.dart";
import 'dart:math';

@Component (selector: "progressbar-demo")
@View (templateUrl: "progressbar-demo.html",
    directives: const [N2S_PROGRESSBAR_DIRECTIVES])
class ProgressbarDemo {
  num max = 200;

  bool showWarning;

  num value;

  String type;

  List stacked = [];

  ProgressbarDemo() {
    random();
    randomStacked();
  }

  random() {
    value = new Random().nextInt(100);
    if (value < 25) {
      type = "success";
    } else if (value < 50) {
      type = "info";
    } else if (value < 75) {
      type = "warning";
    } else {
      type = "danger";
    }
    showWarning = type == "danger" || type == "warning";
  }

  randomStacked() {
    var types = [ "success", "info", "warning", "danger"];
    stacked = [];
//    var total = 0;
    for (var i = 0, n = new Random().nextInt(5); i < n; i ++) {
      var index = new Random().nextInt(4);
      var value = new Random().nextInt(30);
//      total += value;
      stacked.add({'value': value, 'max': value, 'type': types[index]});
    }
  }
}