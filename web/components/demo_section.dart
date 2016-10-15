import 'dart:html';

import "package:angular2/angular2.dart";
import "package:ng_bootstrap/ng_bootstrap.dart";
import 'package:dev_string_converter/dev_string_converter.dart';

@Component (
    selector: "demo-section",
    templateUrl: 'demo_section.html',
    directives: const [BS_DIRECTIVES])
class DemoSection implements OnInit {
  @Input() String name;

  @Input() String docPath;

  String nameTN, docUrl, dart, html;

  ViewContainerRef viewRef;

  DemoSection(@Inject(ViewContainerRef) this.viewRef);

  @override
  ngOnInit() async {
    nameTN = toTableName(name);
    var rawMasterUrl = 'https://raw.githubusercontent.com/dart-league/ng_bootstrap/gh-pages';
    var componentsUrl = '$rawMasterUrl/web/components';
    var _docPath = docPath ?? nameTN;
    docUrl = 'https://www.dartdocs.org/documentation/ng_bootstrap/0.4.0/$_docPath/$_docPath-library.html';
    dart = await HttpRequest.getString('$componentsUrl/$nameTN/${nameTN}_demo.dart');
    html = await HttpRequest.getString('$componentsUrl/$nameTN/${nameTN}_demo.html');
  }
}
