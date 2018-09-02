import 'package:angular/angular.dart';
import 'package:js_shims/js_shims.dart';
import 'dart:html';
import 'dart:async';
import 'package:ng_bootstrap/components/collapse/collapse.dart';

/// List of directives needed to create an accordion
@Deprecated('Renamed to `bsAccordionDirectives`')
const NG_BOOTSTRAP_ACCORDION_DIRECTIVES = bsAccordionDirectives;

/// List of directives needed to create an accordion
const bsAccordionDirectives = const [BsAccordionComponent, BsAccordionPanelComponent];

/// Build on top of the [NgBsCollapse] directive to provide a list of items, with collapsible bodies that
/// are collapsed or expanded by clicking on the item's header.
///
/// Base specifications: [bootstrap 3](http://getbootstrap.com/javascript/#collapse-example-accordion)
/// or [bootstrap 4](http://v4-alpha.getbootstrap.com/components/collapse/#accordion-example)
///
/// [demo](http://dart-league.github.io/ng_bootstrap/#accordion)
@Component (selector: 'bs-accordion',
//    host: const { '[class.panel-group]' : 'true'},
    template: '<ng-content></ng-content>',
    directives: const [coreDirectives, BsAccordionPanelComponent])
class BsAccordionComponent implements AfterContentInit {
  /// if `true` expanding one item will close all others
  @Input() bool closeOthers;

  /// provides the list of children panels
  @ContentChildren(BsAccordionPanelComponent)
  List<BsAccordionPanelComponent> panels;

  @override
  ngAfterContentInit() {
    panels.forEach((p) => p.parentAccordion = this);
  }

  /// close other panels
  closeOtherPanels(BsAccordionPanelComponent openGroup) {
    if (closeOthers == false) {
      return;
    }
    panels.forEach((panel) {
      if (!identical(panel, openGroup)) {
        panel.isOpen = false;
      }
    });
  }

  /// adds a new [panel] at the bottom
  addPanel(BsAccordionPanelComponent panel) {
    panels.add(panel);
  }

  /// removes specified [panel]
  removePanel(BsAccordionPanelComponent panel) {
    panels.remove(panel);
  }
}

/// Creates an accordion-panel
///
/// [demo](http://dart-league.github.io/ng_bootstrap/#accordion)
@Component(selector: 'bs-accordion-panel',
    templateUrl: 'accordion_panel.html',
    directives: const [BsCollapseDirective, coreDirectives])
class BsAccordionPanelComponent implements OnInit {
  /// Constructs a new [BsAccordionPanelComponent] injecting the parent [BsAccordionComponent]
  BsAccordionPanelComponent();

  /// instance of the parent [BsAccordionComponent]
  BsAccordionComponent parentAccordion;

  /// provides an HTML template of the Heading
  TemplateRef headingTemplate;

  /// provides an ability to use Bootstrap's contextual panel classes (`panel-primary`, `panel-success`,
  /// `panel-info`, etc...). List of all available classes [link](http://getbootstrap.com/components/#panels-alternatives)
  @Input() String panelClass;

  /// clickable text in accordion's group header
  @Input() String heading;

  /// if `true` disables accordion group
  @Input() bool isDisabled = false;

  bool _isOpen = false;

  /// is accordion group open or closed
  @HostBinding('class.panel-open')
  bool get isOpen => _isOpen;

  final _isOpenChangeCtrl = new StreamController<bool>.broadcast();
  /// emits if the panel [isOpen]
  @Output() Stream<bool> get isOpenChange => _isOpenChangeCtrl.stream;

  /// if `true` opens the panel
  @Input()
  set isOpen(bool value) {
    isOpenTimer?.cancel();
    isOpenTimer = new Timer(const Duration(milliseconds: 250), () {
      _isOpen = value;
      if (truthy(value)) {
        parentAccordion.closeOtherPanels(this);
      }
      _isOpenChangeCtrl.add(value);

    });
  }

  Timer isOpenTimer;

  /// initialize the default values of the attributes
  @override
  ngOnInit() {
    panelClass = or(panelClass, '');
  }

  /// toggles the [isOpen] state of the panel
  toggleOpen(MouseEvent event) {
    event.preventDefault();
    if (!isDisabled) {
      isOpen = !isOpen;
    }
  }
}