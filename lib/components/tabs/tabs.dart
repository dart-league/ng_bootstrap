import 'dart:async';
import "package:angular/angular.dart";

/// Directives needed to create a tab-set
const NG_BOOTSTRAP_TABS_DIRECTIVES = const [BsTabComponent, BsTabsComponent, BsTabContentComponent, BsTabPanelDirective];

/// todo(adaojunior): refactor this component
/// https://github.com/angular/angular/issues/8563
@Component (
    selector: "bs-tabs",
    templateUrl: 'tabs.html',
    directives: const [coreDirectives])
class BsTabsComponent implements AfterContentInit{
  /// children tabs
  @ContentChildren(BsTabComponent)
  List<BsTabComponent> tabs;

  final _onTabChangeCtrl = new StreamController<BsTabComponent>.broadcast();

  /// emits when the tab number change
  @Output() Stream<BsTabComponent> get onTabChange => _onTabChangeCtrl.stream;

  /// handles selected tab
  BsTabComponent _selected;

  /// gets the selected tab
  BsTabComponent get selected => _selected;

  void ngAfterContentInit(){
    _selected = tabs.firstWhere((BsTabComponent tab) => tab.active, orElse: () {
      final tab = tabs.first;
      tab?.active = true;
      return tab;
    });
  }

  /// sets the selected tab
  void setSelected(BsTabComponent tab){
    tabs.forEach((BsTabComponent tab) => tab.active = false);
    tab.active = true;
    _selected = tab;
    _onTabChangeCtrl.add(tab);
  }

  /// prepends `#` to the [path]
  String toAnchor(String path) => '#$path';
}

@Directive(selector: "template[bsTab]")
class BsTabComponent {
  /// reference to the template
  TemplateRef templateRef;

  /// handles if the tab is active
  @Input() bool active = false;

  /// handles which panel will be selected
  @Input() String select;

  /// constructs a [BsTabComponent]
  BsTabComponent(this.templateRef);
}

@Component(
    selector: 'bs-tab-content',
    template: '<template [ngTemplateOutlet]="current.templateRef"></template>',
    directives: const [coreDirectives])
class BsTabContentComponent implements AfterContentInit {
  /// [BsTabsComponent] target the this content is listening to
  @Input('for') BsTabsComponent target;

  /// displayed panels
  @ContentChildren(BsTabPanelDirective)
  List<BsTabPanelDirective> panels;

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

/// panel of the tabs component
@Directive(selector: 'template[bs-tab-panel]')
class BsTabPanelDirective {
  TemplateRef templateRef;

  @Input() String name;

  BsTabPanelDirective(this.templateRef);
}
