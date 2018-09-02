import 'dart:async';
import "package:angular/angular.dart";

/// Directives needed to create a tab-set
const bsTabsxDirectives = const [BsTabxDirective, BsTabxHeaderDirective, BsTabsxComponents];

@Deprecated('Renamed to "bsTabsxDirectives"')
const BS_TABSX_DIRECTIVES = bsTabsxDirectives;

// todo: fix? mixing static and dynamic tabs position tabs in order of creation
/// Add quick, dynamic tab functionality to transition through panes of local content, even via
/// dropdown menus. **Nested tabs are not supported.**
///
/// Base specifications:
/// [bootstrap 4](http://v4-alpha.getbootstrap.com/components/navs/)
///
/// [demo](http://dart-league.github.io/ng_bootstrap/#tabs)
@Component(selector: "bs-tabsx", templateUrl: 'tabsx.html', directives: const [coreDirectives])
class BsTabsxComponents implements OnInit, AfterContentInit {
  /// if `true` tabs will be placed vertically
  bool get vertical => placement == 'left' || placement == 'right';

  @HostBinding('class.flex-row')
  bool get placementLeft => placement == 'left';

  @HostBinding('class.flex-row-reverse')
  bool get placementRight => placement == 'right';

  @HostBinding('class.flex-column-reverse')
  bool get placementBottom => placement == 'bottom';

  @Input()
  @HostBinding('attr.placement')
  String placement;

  /// if `true` tabs will be justified
  @Input()
  bool justified = false;

  /// navigation context class: 'tabs' or 'pills'
  @Input()
  String type;

  /// List of sub tabs
  @ContentChildren(BsTabxDirective)
  List<BsTabxDirective> tabs = [];

  /// initialize attributes
  ngOnInit() {
    type ??= "tabs";
    placement ??= 'top';
  }

  @override
  ngAfterContentInit() {
    activateTab(tabs.firstWhere((tab) => tab.active, orElse: () => tabs[0]));
  }

  /// adds a new tab at the end
  addTab(BsTabxDirective tab) {
    tabs.add(tab);
    tab.active = tabs.length == 1 && tab.active != false;
  }

  /// removes the specified tab
  removeTab(BsTabxDirective tab) {
    var index = tabs.indexOf(tab);
    if (index == -1) return;

    // Select a new tab if the tab to be removed is selected and not destroyed
    if (tab.active && tabs.length > 1) {
      // If this is the last tab, select the previous tab. else, the next tab.
      var newActiveIndex = index == tabs.length - 1 ? index - 1 : index + 1;
      tabs[newActiveIndex].active = true;
    }
    tabs.remove(tab);
  }

  activateTab(BsTabxDirective tab) {
    if (tab.disabled) return;

    tabs.forEach((t) {
      t.active = t == tab;
    });
  }
}

/// Creates a tab which will be inside the [BsTabsxComponents]
///
/// [demo](http://dart-league.github.io/ng_bootstrap/#tab)
@Directive(selector: "bs-tabx")
class BsTabxDirective {
  @HostBinding("class.tab-pane")
  bool tabPane = true;

  /// provides the injected parent tabset
  BsTabsxComponents tabsx;

  /// if `true` tab can not be activated
  @Input()
  bool disabled = false;

  /// tab header text
  @Input()
  String header;

  /// Template reference to the heading template
  @ContentChild(BsTabxHeaderDirective)
  BsTabxHeaderDirective headerTemplate;

  final _selectCtrl = new StreamController<BsTabxDirective>.broadcast();

  /// emits the selected element change
  @Output()
  Stream<BsTabxDirective> get select => _selectCtrl.stream;

  final _deselectCtrl = new StreamController<BsTabxDirective>.broadcast();

  /// emits the deselected element change
  @Output()
  Stream get deselect => _deselectCtrl.stream;

  bool _active = false;

  /// if tab is active equals true, or set `true` to activate tab
  @HostBinding('class.active')
  get active => _active;

  /// if tab is active equals true, or set `true` to activate tab
  @Input()
  set active(bool active) {
    active ??= true;
    _active = active;
    if (active) {
      _selectCtrl.add(this);
    } else {
      _deselectCtrl.add(this);
    }
  }
}

/// Creates a new tab header template
@Directive (selector: "template[bs-tabx-header]")
class BsTabxHeaderDirective {
  /// constructs a [BsTabxHeaderDirective] injecting its own [templateRef] and its parent [tab]
  BsTabxHeaderDirective(this.templateRef);

  TemplateRef templateRef;
}
