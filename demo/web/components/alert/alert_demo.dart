import 'dart:math';

import "package:angular/angular.dart";
import 'package:ng_bootstrap/components/alert/alert.dart';

@Component(
    selector: "alert-demo", templateUrl: "alert_demo.html", directives: const [BsAlertComponent, coreDirectives])
class AlertDemo {
  List alerts = [
    {"type": "danger", "msg": "Oh snap! Change a few things up and try submitting again.", 'dismissible': false},
    {"type": "success", "msg": "Well done! You successfully read this important alert message.", "dismissible": true}
  ];

  closeAlert(num i) {
    alerts.removeAt(i);
  }

  addAlert() {
    var type = ['info', 'success', 'warning', 'danger'][new Random().nextInt(4)];
    alerts.add({
      "msg": "Another alert! This alert will dismiss in 3s",
      'dismissible': true,
      "type": type,
      'timeout': 3000
    });
  }
}
