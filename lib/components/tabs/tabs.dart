import "package:angular2/angular2.dart";

/// Directives needed to create a tab-set
const NG_BOOTSTRAP_TABS_DIRECTIVES = const [BsTabComponent, BsTabsComponent, BsTabContentComponent, BsTabPanelDirective];

/// todo(adaojunior): refactor this component
/// https://github.com/angular/angular/issues/8563
@Component (
    selector: "bs-tabs",
    templateUrl: 'tabs.html')
class BsTabsComponent implements AfterContentInit{
  @ContentChildren(BsTabComponent)
  QueryList<BsTabComponent> tabs;

  @Output()
  EventEmitter onTabChange = new EventEmitter();

  BsTabComponent _selected;

  BsTabComponent get selected => _selected;

  void ngAfterContentInit(){
    _selected = tabs.firstWhere((BsTabComponent tab) => tab.active, orElse: () {
      final tab = tabs.first;
      tab?.active = true;
      return tab;
    });
  }

  void setSelected(BsTabComponent tab){
    tabs.forEach((BsTabComponent tab) => tab.active = false);
    tab.active = true;
    _selected = tab;
    onTabChange.add(tab);
  }

  String toAnchor(String path) => '#$path';
}

@Directive(selector: "template[bsTab]")
class BsTabComponent {
  TemplateRef templateRef;

  @Input() bool active = false;

  @Input() String select;

  BsTabComponent(this.templateRef);
}

@Component(
    selector: 'bs-tab-content',
    template: '<template [ngTemplateOutlet]="current.templateRef"></template>')
class BsTabContentComponent implements AfterContentInit {
  /// [BsTabsComponent] target the this content is listening to
  @Input('for') BsTabsComponent target;

  @ContentChildren(BsTabPanelDirective)
  QueryList<BsTabPanelDirective> panels;

  BsTabPanelDirective _current;

  /// Current tab panel
  BsTabPanelDirective get current => _current;

  void ngAfterContentInit() {
    _setCurrent(target.selected);
    target.onTabChange.listen(_setCurrent);
  }

  void _setCurrent(BsTabComponent tab){
    _current = panels.firstWhere((BsTabPanelDirective panel) => panel.name == tab?.select);
  }
}

@Directive(selector: 'template[bs-tab-panel]')
class BsTabPanelDirective {
  TemplateRef templateRef;

  @Input() String name;

  BsTabPanelDirective(this.templateRef);
}
