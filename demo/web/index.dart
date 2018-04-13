library ngbs.index;

import "package:angular/angular.dart";
import 'package:dson/dson.dart';

import 'components/accordion/accordion_demo.dart';
import 'components/alert/alert_demo.dart';
import 'components/buttons/buttons_demo.dart';
import 'components/carousel/carousel_demo.dart';
import 'components/collapse/collapse_demo.dart';
import 'components/datepicker/datepicker_demo.dart';
import "components/demo_header.dart";
import "components/demo_section.dart";
import 'components/dropdown/dropdown_demo.dart';
import 'components/file_upload/file_upload_demo.dart';
import 'components/input/input_demo.dart';
import 'components/modal/modal_demo.dart';
import 'components/pagination/pagination_demo.dart';
import 'components/popover/popover_demo.dart';
import 'components/progress/progress_demo.dart';
import 'components/prompt/prompt_demo.dart';
import 'components/rating/rating_demo.dart';
import 'components/table/table_demo.dart';
import 'components/tabs/tabs_demo.dart';
import 'components/tabsx/tabsx_demo.dart';
import 'components/timepicker/timepicker_demo.dart';
import 'components/tooltip/tooltip_demo.dart';
import 'components/typeahead/typeahead_demo.dart';

// ignore: uri_has_not_been_generated
import 'index.template.dart' show DemoComponentNgFactory;

part 'index.g.dart';

@Component(
    selector: "app",
    templateUrl: 'demo.html',
    directives: const [
      DemoHeader,
      DemoSection,
      AccordionDemo,
      AlertDemo,
      ButtonsDemo,
      CarouselDemo,
      CollapseDemo,
      DatepickerDemo,
      DropdownDemo,
      FileUploadDemoComponent,
      InputDemo,
      ModalDemo,
      PaginationDemo,
      PopoverDemo,
      ProgressDemo,
      PromptDemo,
      RatingDemo,
      TableDemoComponent,
      TabsDemo,
      TabsxDemo,
      TimepickerDemo,
      TooltipDemo,
      TypeaheadDemo
    ])
class DemoComponent {}

main() {
  _initMirrors();
  runApp(DemoComponentNgFactory);
}
