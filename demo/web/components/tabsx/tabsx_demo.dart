import "package:angular/angular.dart";
import 'dart:async';
import 'dart:html';
import 'package:ng_bootstrap/components/tabsx/tabsx.dart';

@Component(selector: "tabsx-demo",
    templateUrl: "tabsx_demo.html",
    directives: const [bsTabsxDirectives, coreDirectives])
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
