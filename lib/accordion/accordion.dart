import 'package:angular2/angular2.dart';
import 'package:node_shims/js.dart';
import 'dart:html';
import 'package:ng2_strap/collapse/collapse.dart';
import 'package:ng2_strap/common.dart';
import 'dart:async';

/// Build on top of the [N2sCollapse] directive to provide a list of items, with collapsible bodies that
/// are collapsed or expanded by clicking on the item's header.
///
/// Base specifications: [bootstrap 3](http://getbootstrap.com/javascript/#collapse-example-accordion)
/// or [bootstrap 4](http://v4-alpha.getbootstrap.com/components/collapse/#accordion-example)
///
/// [demo](http://luisvt.github.io/ng2_strap/#accordion)
@Component (selector: 'n2s-accordion',
    host: const { '[class.panel-group]' : 'true'},
    template: '<ng-content></ng-content>')
class N2sAccordion {
  /// if `true` expanding one item will close all others
  @Input() bool closeOthers;

  /// provides the list of children panels
  List<N2sAccordionPanel> panels = [];

  /// close other panels
  closeOtherPanels(N2sAccordionPanel openGroup) {
    if (!closeOthers) {
      return;
    }
    panels.forEach((N2sAccordionPanel group) {
      if (!identical(group, openGroup)) {
        group.isOpen = false;
      }
    });
  }

  /// adds a new [panel] at the bottom
  addPanel(N2sAccordionPanel panel) {
    panels.add(panel);
  }

  /// removes specified [panel]
  removePanel(N2sAccordionPanel panel) {
    panels.remove(panel);
  }
}

/// Creates an accordion-panel
///
/// [demo](http://luisvt.github.io/ng2_strap/#accordion)
@Component(selector: 'n2s-accordion-panel',
    host: const { '[class.panel-open]' : 'isOpen'},
    templateUrl: 'accordion_panel.html',
    directives: const [N2sCollapse, N2sTransclude])
class N2sAccordionPanel implements OnInit, OnDestroy {
  /// Constructs a new [N2sAccordionPanel] injecting the parent [N2sAccordion]
  N2sAccordionPanel(this.accordion);

  /// instance of the parent [N2sAccordion]
  N2sAccordion accordion;

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

  /// emits if the panel [isOpen]
  @Output() EventEmitter<bool> isOpenChange = new EventEmitter<bool>();

  /// if `true` opens the panel
  @Input()
  set isOpen(bool value) {
    // Future.delayed added to avoid error EXCEPTION: Expression has changed after it was checked.
    new Future.delayed(Duration.ZERO, () {
      _isOpen = value;
      if (truthy(value)) {
        accordion.closeOtherPanels(this);
      }
      isOpenChange.emit(value);
    });
  }

  /// initialize the default values of the attributes
  @override
  ngOnInit() {
    panelClass = or(panelClass, 'panel-default');
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

/// List of directives needed to create an accordion
const List<dynamic> N2S_ACCORDION_DIRECTIVES = const [
  N2sAccordion, N2sAccordionPanel];