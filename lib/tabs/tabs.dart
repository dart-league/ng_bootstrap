import "package:angular2/angular2.dart";
import 'package:ng2_strap/common.dart';
import 'package:node_shims/js.dart';

// todo: add active event to tab

// todo: fix? mixing static and dynamic tabs position tabs in order of creation
/// Add quick, dynamic tab functionality to transition through panes of local content, even via
/// dropdown menus. **Nested tabs are not supported.**
///
/// Base specifications: [bootstrap 3](http://getbootstrap.com/javascript/#tabs) or
/// [bootstrap 4](http://v4-alpha.getbootstrap.com/components/navs/)
///
/// [demo](http://luisvt.github.io/ng2_strap/#tabs)
@Component (
    selector: "n2s-tab-set",
    templateUrl: 'tabset.html',
    directives: const [N2sTransclude])
class N2sTabSet implements OnInit {

  /// if `true` tabs will be placed vertically
  @Input() bool vertical = false;

  /// if `true` tabs will be justified
  @Input() bool justified = false;

  /// navigation context class: 'tabs' or 'pills'
  @Input() String type;

  /// List of sub tabs
  List<N2sTab> tabs = [];

  /// initialize attributes
  ngOnInit() {
    type ??= "tabs";
  }

  /// adds a new tab at the end
  addTab(N2sTab tab) {
    tabs.add(tab);
    tab.active = tabs.length == 1 && tab.active != false;
  }

  /// removes the specified tab
  removeTab(N2sTab tab) {
    var index = tabs.indexOf(tab);
    if (identical(index, -1)) {
      return;
    }
    // Select a new tab if the tab to be removed is selected and not destroyed
    if (tab.active && tabs.length > 1) {
      // If this is the last tab, select the previous tab. else, the next tab.
      var newActiveIndex = identical(index, tabs.length - 1)
          ? index - 1
          : index + 1;
      tabs [ newActiveIndex ].active = true;
    }
    slice(tabs, index, 1);
  }
}

/// Creates a tab which will be inside the [N2sTabSet]
///
/// [demo](http://luisvt.github.io/ng2_strap/#tab)
@Directive (selector: "n2s-tab",
    host: const { "[class.tab-pane]" : "true", "[class.active]" : "active"})
class N2sTab implements OnInit, OnDestroy {
  /// Construct a tab injecting the parent [tabset], and adding itself to the parent.
  N2sTab(this.tabset);

  /// provides the injected parent tabset
  N2sTabSet tabset;

  /// if `true` tab can not be activated
  @Input() bool disabled = false;

  /// tab header text
  @Input() String heading;

  /// Template reference to the heading template
  TemplateRef headingRef;

  /// emits the selected element change
  @Output() EventEmitter select = new EventEmitter ();

  /// emits the deselected element change
  @Output() EventEmitter deselect = new EventEmitter ();

  bool _active = true;

  /// if tab is active equals true, or set `true` to activate tab
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
    tabset.tabs.forEach((N2sTab tab) {
      if (!identical(tab, this)) {
        tab.active = false;
      }
    });
  }

  /// add itself to its parent tabset
  ngOnInit() {
    tabset.addTab(this);
  }

  /// remove itself from its parent
  ngOnDestroy() {
    tabset.removeTab(this);
  }
}

/// Creates a new tab header template
@Directive (selector: "[n2s-tab-heading]")
class N2sTabHeading {
  /// constructs a [N2sTabHeading] injecting its own [templateRef] and its parent [tab]
  N2sTabHeading(this.templateRef, N2sTab tab) {
    tab.headingRef = templateRef;
  }

  /// DOM template reference
  TemplateRef templateRef;
}

/// Directives needed to create a tab-set
const N2S_TABS_DIRECTIVES = const [N2sTab, N2sTabHeading, N2sTabSet];