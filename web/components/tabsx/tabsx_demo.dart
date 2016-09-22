import "package:angular2/angular2.dart";
import 'dart:async';
import 'dart:html';
import 'package:ng_bootstrap/components/tabsx/tabsx.dart';

@Component(selector: "tabsx-demo")
@View(templateUrl: "tabsx_demo.html", directives: const [BS_TABSX_DIRECTIVES])
class TabsxDemo {
  var tabs = [{
    "title": "Dynamic Title 1",
    "content": "Dynamic content 1"
  }, {
    "title": "Dynamic Title 2",
    "content": "Dynamic content 2",
    "disabled": true
  }];

  alertMe() {
    new Timer(const Duration(seconds: 1), () {
      window.alert("You've selected the alert tab!");
    });
  }
}
