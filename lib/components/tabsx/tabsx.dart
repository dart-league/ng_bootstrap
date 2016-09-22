import "package:angular2/angular2.dart";
import 'package:node_shims/js.dart';

/// Directives needed to create a tab-set
const NG_BOOTSTRAP_TABSX_DIRECTIVES = const [BsTabxDirective, BsTabxHeaderDirective, BsTabsxComponents];

// todo: fix? mixing static and dynamic tabs position tabs in order of creation
/// Add quick, dynamic tab functionality to transition through panes of local content, even via
/// dropdown menus. **Nested tabs are not supported.**
///
/// Base specifications: [bootstrap 3](http://getbootstrap.com/javascript/#tabs) or
/// [bootstrap 4](http://v4-alpha.getbootstrap.com/components/navs/)
///
/// [demo](http://luisvt.github.io/ng2_strap/#tabs)
@Component (
    selector: "bs-tabsx",
    templateUrl: 'tabsx.html')
class BsTabsxComponents implements OnInit {

  /// if `true` tabs will be placed vertically
  @Input() bool vertical = false;

  /// if `true` tabs will be justified
  @Input() bool justified = false;

  /// navigation context class: 'tabs' or 'pills'
  @Input() String type;

  /// List of sub tabs
  List<BsTabxDirective> tabs = [];

  /// initialize attributes
  ngOnInit() {
    type ??= "tabs";
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
      var newActiveIndex = index == tabs.length - 1
          ? index - 1
          : index + 1;
      tabs[newActiveIndex].active = true;
    }
    tabs.remove(tab);
  }
}

/// Creates a tab which will be inside the [BsTabsxComponents]
///
/// [demo](http://luisvt.github.io/ng2_strap/#tab)
@Directive(selector: "bs-tabx",
    host: const { "[class.tab-pane]" : "true"})
class BsTabxDirective implements OnInit, OnDestroy {
  /// Construct a tab injecting the parent [tabsx], and adding itself to the parent.
  BsTabxDirective(this.tabsx);

  /// provides the injected parent tabset
  BsTabsxComponents tabsx;

  /// if `true` tab can not be activated
  @Input() bool disabled = false;

  /// tab header text
  @Input() String header;

  /// Template reference to the heading template
  TemplateRef headerRef;

  /// emits the selected element change
  @Output() EventEmitter select = new EventEmitter ();

  /// emits the deselected element change
  @Output() EventEmitter deselect = new EventEmitter ();

  bool _active = true;

  /// if tab is active equals true, or set `true` to activate tab
  @HostBinding('class.active')
  get active {
    return _active;
  }

  /// if tab is active equals true, or set `true` to activate tab
  @Input() set active(bool active) {
    active ??= true;
    if (disabled && active != null || !active) {
      if (!active) {
        _active = active;
      }
      deselect.add(this);
      return;
    }
    _active = active;
    select.add(this);
    tabsx.tabs.forEach((BsTabxDirective tab) {
      if (!identical(tab, this)) {
        tab.active = false;
      }
    });
  }

  /// add itself to its parent tabset
  ngOnInit() {
    tabsx.addTab(this);
  }

  /// remove itself from its parent
  ngOnDestroy() {
    tabsx.removeTab(this);
  }
}

/// Creates a new tab header template
@Directive (selector: "template[bs-tabx-header]")
class BsTabxHeaderDirective {
  /// constructs a [BsTabxHeaderDirective] injecting its own [templateRef] and its parent [tab]
  BsTabxHeaderDirective(TemplateRef templateRef, BsTabxDirective tab) {
    tab.headerRef = templateRef;
  }
}