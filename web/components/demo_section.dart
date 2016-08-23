import 'dart:html';

import "package:angular2/angular2.dart";
import "package:ng_bootstrap/ng_bootstrap.dart";

@Component (
    selector: "demo-section",
    templateUrl: 'demo_section.html',
    directives: const [NG_BOOTSTRAP_DIRECTIVES])
class DemoSection implements OnInit {
  @Input() String name;

  String nameLC, docUrl, doc, titleDoc, dart, html;

  ViewContainerRef viewRef;

  DemoSection(@Inject(ViewContainerRef) this.viewRef);

  @override
  ngOnInit() async {
    nameLC = name.toLowerCase();
    var rawMasterUrl = 'https://raw.githubusercontent.com/dart-league/ng_bootstrap/develop';
    var componentsUrl = '$rawMasterUrl/web/components';
    docUrl = 'https://www.dartdocs.org/documentation/ng_bootstrap/0.2.2/$nameLC/$nameLC-library.html';
    dart = await HttpRequest.getString('$componentsUrl/$nameLC/${nameLC}_demo.dart');
    html = await HttpRequest.getString('$componentsUrl/$nameLC/${nameLC}_demo.html');
  }
}
