import "package:angular2/angular2.dart";
import 'package:ng_bootstrap/components.dart';
import 'dart:async';
import 'dart:html';

@Component(selector: "tabs-demo")
@View(templateUrl: "tabs_demo.html", directives: const [NGBS_TABS_DIRECTIVES])
class TabsDemo {
  var tabs = [
    {
      "title": "Dynamic Title 1",
      "content": "Dynamic content 1"
    },
    {
      "title": "Dynamic Title 2",
      "content": "Dynamic content 2",
      "disabled": true
    }
  ];
  alertMe() {
    new Timer(const Duration(seconds: 1), () {
      window.alert("You've selected the alert tab!");
    });
  }
}
