import 'package:angular/angular.dart';
import 'package:node_shims/js.dart';
import 'dart:html';
import 'dart:async';
import 'package:ng_bootstrap/components/collapse/collapse.dart';

/// List of directives needed to create an accordion
const NG_BOOTSTRAP_ACCORDION_DIRECTIVES = const [BsAccordionComponent, BsAccordionPanelComponent];

/// Build on top of the [NgBsCollapse] directive to provide a list of items, with collapsible bodies that
/// are collapsed or expanded by clicking on the item's header.
///
/// Base specifications: [bootstrap 3](http://getbootstrap.com/javascript/#collapse-example-accordion)
/// or [bootstrap 4](http://v4-alpha.getbootstrap.com/components/collapse/#accordion-example)
///
/// [demo](http://luisvt.github.io/ng2_strap/#accordion)
@Component (selector: 'bs-accordion',
//    host: const { '[class.panel-group]' : 'true'},
    template: '<ng-content></ng-content>',
    directives: const [CORE_DIRECTIVES])
class BsAccordionComponent {
  /// if `true` expanding one item will close all others
  @Input() bool closeOthers;

  /// provides the list of children panels
  List<BsAccordionPanelComponent> panels = [];

  /// close other panels
  closeOtherPanels(BsAccordionPanelComponent openGroup) {
    if (closeOthers == false) {
      return;
    }
    panels.forEach((BsAccordionPanelComponent group) {
      if (!identical(group, openGroup)) {
        group.isOpen = false;
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
/// [demo](http://luisvt.github.io/ng2_strap/#accordion)
@Component(selector: 'bs-accordion-panel',
    host: const { '[class.panel-open]' : 'isOpen'},
    templateUrl: 'accordion_panel.html',
    directives: const [BsCollapseDirective, CORE_DIRECTIVES])
class BsAccordionPanelComponent implements OnInit, OnDestroy {
  /// Constructs a new [BsAccordionPanelComponent] injecting the parent [BsAccordionComponent]
  BsAccordionPanelComponent(this.accordion);

  /// instance of the parent [BsAccordionComponent]
  BsAccordionComponent accordion;

  /// provides an HTML template of the Heading
  TemplateRef headingTemplate;

  /// provides an ability to use Bootstrap's contextual panel classes (`panel-primary`, `panel-success`,
  /// `panel-info`, etc...). List of all available classes [link](http://getbootstrap.com/components/#panels-alternatives)
  @Input() String panelClass;

  /// clickable text in accordion's group header
  @Input() String heading;

  /// if `true` disables accordion group
  @Input() bool isDisabled = false;

  bool _isOpen;

  /// is accordion group open or closed
  bool get isOpen => _isOpen;

  final _isOpenChangeCtrl = new StreamController<bool>.broadcast();
  /// emits if the panel [isOpen]
  @Output() Stream<bool> get isOpenChange => _isOpenChangeCtrl.stream;

  /// if `true` opens the panel
  @Input()
  set isOpen(bool value) {
    // Future.delayed added to avoid error EXCEPTION: Expression has changed after it was checked.
    new Future(() {
      _isOpen = value;
      if (truthy(value)) {
        accordion.closeOtherPanels(this);
      }
      _isOpenChangeCtrl.add(value);
    });
  }

  /// initialize the default values of the attributes
  @override
  ngOnInit() {
    panelClass = or(panelClass, '');
    accordion.addPanel(this);
    _isOpen ??= false;
  }

  /// destroys the panel
  @override
  ngOnDestroy() {
    accordion.removePanel(this);
  }

  /// toggles the [isOpen] state of the panel
  toggleOpen(MouseEvent event) {
    event.preventDefault();
    if (!isDisabled) {
      isOpen = !isOpen;
    }
  }
}