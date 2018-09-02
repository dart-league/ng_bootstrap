import "package:angular/angular.dart";
import 'package:angular_forms/angular_forms.dart';
import 'package:ng_bootstrap/components/accordion/accordion.dart';

@Component(selector: "accordion-demo",
    templateUrl: "accordion_demo.html",
    directives: const [bsAccordionDirectives, coreDirectives, formDirectives])
class AccordionDemo {
  bool oneAtATime = true;

  List<String> items = ["Item 1", "Item 2", "Item 3"];

  Map status = {"isFirstOpen": true, "isFirstDisabled": false, 'isLastOpen': false};

  List<dynamic> groups = [
    {"title": "Dynamic Group Header - 1", "content": "Dynamic Group Body - 1"},
    {"title": "Dynamic Group Header - 2", "content": "Dynamic Group Body - 2"}
  ];

  addItem() {
    this.items.add('Item ${this.items.length + 1}');
  }
}
