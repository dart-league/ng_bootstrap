import 'package:angular2/angular2.dart';
import 'package:ng2_strap/position.dart';
import 'dart:async';
import 'dart:html';

/// Options passed when creating a new Tooltip
class N2sTooltipOptions {

  /// Construct the options for tooltip
  const N2sTooltipOptions({
  this.placement,
  this.popupClass,
  this.animation,
  this.isOpen,
  this.content,
  this.hostEl
  });

  /// tooltip positioning instruction, supported positions: 'top', 'bottom', 'left', 'right'
  final String placement;

  /// (*not implemented*) - custom tooltip class applied to the tooltip container.
  final String popupClass;

  final bool animation;

  /// if `true` tooltip is currently visible
  final bool isOpen;

  /// text of tooltip
  final content;

  final ElementRef hostEl;
}

@Component (selector: 'n2s-tooltip-container',
    templateUrl: 'tooltip_container.html',
    encapsulation: ViewEncapsulation.None)
class N2sTooltipContainer implements AfterViewInit {

  /// Constructs a new [N2sTooltipContainer] injecting its [elementRef] and the [options]
  N2sTooltipContainer(this.elementRef, this.cdr, N2sTooltipOptions options) {
    classMap = { 'in' : false, 'fade': false};
    placement = options.placement;
    popupClass = options.popupClass;
    animation = options.animation;
    isOpen = options.isOpen;
    content = options.content;
    hostEl = options.hostEl;
    classMap[placement] = true;
  }

  ChangeDetectorRef cdr;

  /// Current element DOM reference
  ElementRef elementRef;

  /// map of css classes values
  Map<String, dynamic> classMap;

  /// value in pixels of the top style
  String top;

  /// value in pixels of the left style
  String left;

  /// display style of the tooltip
  String display;

  /// text of tooltip
  String content;

  String placement = 'top';

  /// (*not implemented*) (`?boolean=false`) - if `true` tooltip will be appended to body
  bool appendToBody = false;

  /// if `true` tooltip is currently visible
  bool isOpen;

  /// (*not implemented*) (`?string`) - custom tooltip class applied to the tooltip container.
  String popupClass;

  /// if `false` fade tooltip animation will be disabled
  bool animation;

  ElementRef hostEl;

  /// positions its DOM element next to the parent in the desired position
  @override
  ngAfterViewInit() {
    display = 'block';
    var p = positionElements(
        hostEl.nativeElement,
        elementRef.nativeElement.children[0],
        placement,
        appendToBody);
    top = p.top.toString() + 'px';
    left = p.left.toString() + 'px';
    classMap['in'] = true;
  }
}

/// Inspired by the excellent Tipsy jQuery plugin written by Jason Frame. Tooltips are an updated
/// version, which don’t rely on images, use CSS3 for animations, and much more.
///
/// Base specifications: [bootstrap 3](http://getbootstrap.com/javascript/#tooltips) or
/// [bootstrap 4](http://v4-alpha.getbootstrap.com/components/tooltips/)
///
/// [demo](http://luisvt.github.io/ng2_strap/#tooltip)
@Directive(selector: '[n2sTooltip]')
class N2sTooltip {
  /// Constructs a new [N2sTooltip] injecting [viewContainerRef] and [loader]
  N2sTooltip(this.viewContainerRef, this.loader);

  /// Reference to HTML DOM
  ViewContainerRef viewContainerRef;

  /// load components dynamically
  DynamicComponentLoader loader;

  ///
  bool visible = false;

  /// text of tooltip
  @Input('n2sTooltip') String content;

  /// tooltip positioning instruction, supported positions: 'top', 'bottom', 'left', 'right'
  @Input('n2sTooltipPlacement') String placement = 'top';

  /// (*not implemented*) (`?boolean=false`) - if `true` tooltip will be appended to body
  @Input('n2sTooltipAppendToBody') bool appendToBody = false;

  /// if `true` tooltip is currently visible
  @Input('n2sTooltipIsOpen') bool isOpen;

  bool _enable = true;

  /// if `false` tooltip is disabled and will not be shown
  @Input('n2sTooltipEnable') set enable(bool enable) {
    _enable = enable ?? true;
    if (!_enable) {
      hide();
    }
  }

  /// array of event names which triggers tooltip opening
  @Input('n2sTooltipTrigger') String trigger;

  /// (*not implemented*) (`?string`) - custom tooltip class applied to the tooltip container.
  @Input('n2sTooltipClass') String popupClass;

  /// DOM reference to tooltip component
  Future<ComponentRef> tooltip;

  /// show the tooltip when mouseleave and focusout events happens
  @HostListener('mouseenter', const ['\$event'])
  @HostListener('focusin', const ['\$event'])
  show([Event event]) {
    if (event is MouseEvent && trigger == 'focus'
        || event is FocusEvent && trigger == 'mouse') {
      return;
    }
    if (visible || !_enable) {
      return;
    }
    visible = true;
    var options = new N2sTooltipOptions(
        content: content,
        placement: placement,
        popupClass: popupClass,
        hostEl: viewContainerRef.element);
    var providers = ReflectiveInjector.resolve([provide(N2sTooltipOptions, useValue: options)]);
    tooltip = loader.loadNextToLocation(N2sTooltipContainer, viewContainerRef, providers);
  }

  /// hide the tooltip when mouseleave and focusout events happens
  @HostListener('mouseleave', const ['\$event'])
  @HostListener('focusout', const ['\$event'])
  hide([Event event]) {
    if (event is MouseEvent && trigger == 'focus'
        || event is FocusEvent && trigger == 'mouse') {
      return;
    }
    if (!visible) {
      return;
    }
    visible = false;
    tooltip.then((ComponentRef componentRef) {
      componentRef.destroy();
      return componentRef;
    });
  }
}

///
const N2S_TOOLTIP_DIRECTIVES = const [N2sTooltip, N2sTooltipContainer];
