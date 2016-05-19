import "package:angular2/angular2.dart";
import "package:ng2_strap/alert/alert.dart";

@Component(
    selector: "alert-demo",
    templateUrl: "alert-demo.html",
    directives: const [N2sAlert])
class AlertDemo {
  List alerts = [
    {
      "type": "danger",
      "msg": "Oh snap! Change a few things up and try submitting again.",
      'closable': false
    },
    {
      "type": "success",
      "msg": "Well done! You successfully read this important alert message.",
      "closable": true
    }
  ];
  closeAlert(num i) {
    alerts.removeAt(i);
  }

  addAlert() {
    alerts.add({"msg": "Another alert!", 'closable': true});
  }
}
