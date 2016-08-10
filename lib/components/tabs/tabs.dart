import "package:angular2/angular2.dart";

/// Directives needed to create a tab-set
const NG_BOOTSTRAP_TABS_DIRECTIVES = const [Tab, Tabs, TabContent, TabPanel];

/// todo(adaojunior): refactor this component
/// https://github.com/angular/angular/issues/8563
@Component (
    selector: "bs-tabs",
    templateUrl: 'tabs.html')
class Tabs implements AfterContentInit{
  @ContentChildren(Tab)
  QueryList<Tab> tabs;

  @Output()
  EventEmitter onTabChange = new EventEmitter();

  Tab _selected;

  Tab get selected => _selected;

  void ngAfterContentInit(){
    _selected = tabs.firstWhere((Tab tab) => tab.active, orElse: () {
      final tab = tabs.first;
      tab?.active = true;
      return tab;
    });
  }

  void setSelected(Tab tab){
    tabs.forEach((Tab tab) => tab.active = false);
    tab.active = true;
    _selected = tab;
    onTabChange.add(tab);
  }

  String toAnchor(String path) => '#$path';
}

@Directive(selector: "template[bsTab]")
class Tab {
  TemplateRef templateRef;

  @Input() bool active = false;

  @Input() String select;

  Tab(this.templateRef);
}

@Component(
    selector: 'bs-tab-content',
    template: '<template [ngTemplateOutlet]="current.templateRef"></template>')
class TabContent implements AfterContentInit {
  /// [Tabs] target the this content is listening to
  @Input('for') Tabs target;

  @ContentChildren(TabPanel)
  QueryList<TabPanel> panels;

  TabPanel _current;

  /// Current tab panel
  TabPanel get current => _current;

  void ngAfterContentInit() {
    _setCurrent(target.selected);
    target.onTabChange.listen(_setCurrent);
  }

  void _setCurrent(Tab tab){
    _current = panels.firstWhere((TabPanel panel) => panel.name == tab?.select);
  }
}

@Directive(selector: 'template[bs-tab-panel]')
class TabPanel {
  TemplateRef templateRef;

  @Input() String name;

  TabPanel(this.templateRef);
}
