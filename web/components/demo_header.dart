import "package:angular2/angular2.dart";
import "package:ng_bootstrap/ng_bootstrap.dart";
import 'package:dev_string_converter/dev_string_converter.dart' as dsc;

@Component(
    selector: "demo-header",
    templateUrl: 'demo_header.html',
    directives: const [BS_DIRECTIVES])
class DemoHeader {
  List<String> components = [
    "Accordion",
    "Alert",
    "Buttons",
    "Carousel",
    "Collapse",
    "Datepicker",
    "Dropdown",
    "File Upload",
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

  Function toTableName = dsc.toTableName;

  DemoHeader() {
    this.prefix =  "";
  }
}