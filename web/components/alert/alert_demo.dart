import "package:angular2/angular2.dart";
import 'package:ng_bootstrap/ng_bootstrap.dart';

@Component(
    selector: "alert-demo",
    templateUrl: "alert_demo.html",
    directives: const [BS_DIRECTIVES])
class AlertDemo {
  List alerts = [
    {
      "type": "danger",
      "msg": "Oh snap! Change a few things up and try submitting again.",
      'dismissible': false
    },
    {
      "type": "success",
      "msg": "Well done! You successfully read this important alert message.",
      "dismissible": true
    }
  ];

  closeAlert(num i) {
    alerts.removeAt(i);
  }

  addAlert() {
    alerts.add({"msg": "Another alert!", 'dismissible': true, "type": "info"});
  }
}
