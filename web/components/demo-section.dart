import 'dart:html';

import "package:angular2/angular2.dart";
import "package:ng2_strap/index.dart";

@Component (
    selector: "demo-section",
    templateUrl: 'demo-section.html',
    directives: const [N2S_TABS_DIRECTIVES])
class DemoSection implements OnInit {
  @Input() String name;

  String nameLC, docUrl, doc, titleDoc, dart, html;

  ViewContainerRef viewRef;

  DemoSection(@Inject(ViewContainerRef) this.viewRef);

  @override
  ngOnInit() async {
    nameLC = name.toLowerCase();
    var rawMasterUrl = 'https://raw.githubusercontent.com/luisvt/ng2_strap/master';
    var componentsUrl = '$rawMasterUrl/web/components';
    docUrl = 'https://www.dartdocs.org/documentation/ng2_strap/0.0.3/$nameLC/$nameLC-library.html';
    dart = await HttpRequest.getString('$componentsUrl/$nameLC/$nameLC-demo.dart');
    html = await HttpRequest.getString('$componentsUrl/$nameLC/$nameLC-demo.html');
  }
}
