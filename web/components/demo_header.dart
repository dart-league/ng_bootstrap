import "package:angular2/angular2.dart";
import "package:ng_bootstrap/ng_bootstrap.dart";

@Component(
    selector: "demo-header",
    templateUrl: 'demo_header.html',
    directives: const [NG_BOOTSTRAP_DIRECTIVES])
class DemoHeader {
  List<String> components = [
    "Accordion",
    "Alert",
    "Buttons",
    "Carousel",
    "Collapse",
    "Datepicker",
    "Dropdown",
    "Modal",
    "Pagination",
    "Progress",
    "Rating",
    "Table",
    "Tabs",
    "Tabsx",
    "Timepicker",
    "Tooltip",
    "Typeahead"
  ];

  String prefix;

  bool isCollapsed = true;

  DemoHeader() {
    this.prefix =  "";
  }
}