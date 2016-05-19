import "package:angular2/angular2.dart";
import "package:ng2_strap/index.dart";

@Component(
    selector: "demo-header",
    templateUrl: 'demo-header.html',
    directives: const [N2sCollapse, N2S_DROPDOWN_DIRECTIVES])
class DemoHeader {
  List<String> components = [
    "Accordion",
    "Alert",
    "Buttons",
    "Carousel",
    "Collapse",
    "Datepicker",
    "Dropdown",
    "Pagination",
    "Progressbar",
    "Rating",
    "Tabs",
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