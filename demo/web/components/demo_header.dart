import "package:angular/angular.dart";
import "package:ng_bootstrap/ng_bootstrap.dart";
import 'package:dev_string_converter/dev_string_converter.dart' as dsc;

@Component(
    selector: "demo-header",
    templateUrl: 'demo_header.html',
    directives: const [BS_DIRECTIVES, coreDirectives])
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
    "Input",
    "Modal",
    "Pagination",
    "Popover",
    "Progress",
    "Prompt",
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
