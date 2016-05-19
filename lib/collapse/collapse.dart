import "package:angular2/angular2.dart";
import 'dart:async';
// todo: add animate

/// Collapse component allows you to toggle content on your pages with a bit of JavaScript and some
/// classes. Flexible component that utilizes a handful of classes (from the **required transitions
/// component**(*not yet implemented*)) for easy toggle behavior.
///
/// Base specifications: [bootstrap 3](http://getbootstrap.com/javascript/#collapse)
/// or [bootstrap 4](http://v4-alpha.getbootstrap.com/components/collapse/)
///
/// [demo](http://luisvt.github.io/ng2_strap/#collapse)
@Directive(selector: "[n2sCollapse]",
    host: const {
      "[class.in]" : "isExpanded",
      "[class.collapse]" : "isCollapse",
      "[class.collapsing]" : "isCollapsing",
      "[attr.aria-expanded]" : "isExpanded",
      "[attr.aria-hidden]" : "isCollapsed",
      "[style.height]" : "height"
    })
class N2sCollapse {
  /// Constructs an collapsible component injecting the [elementRef]
  N2sCollapse(this.elementRef);

  /// Contains the element reference of this component
  ElementRef elementRef;

  /// provides the height style of the component in pixels
  String height;

  // classes

  /// if `true` the component is shown
  bool isExpanded = true;

  /// if `true` the component is hidden
  bool isCollapsed = false;

  /// provides the animation state
  bool isCollapsing = false;

  /// stale state
  bool isCollapse = true;

  /// sets and fires the collapsed state of the component
  @Input() set n2sCollapse(bool value) {
    if (value ?? false) {
      hide();
    } else {
      show();
    }
  }

  hide() {
    if(isCollapsed) return;

    isCollapse = false;
    isCollapsing = true;
    isExpanded = false;
    isCollapsed = true;
    new Timer(const Duration(milliseconds: 4), () {
      height = "0";
      isCollapse = true;
      isCollapsing = false;
    });
  }

  show() {
    if(isExpanded) return;

    isCollapse = false;
    isCollapsing = true;
    isExpanded = true;
    isCollapsed = false;
    new Timer(const Duration(milliseconds: 4), () {
      height = "auto";
      isCollapse = true;
      isCollapsing = false;
    });
  }
}