import 'dart:html';
import 'package:angular/angular.dart';
import 'dart:async';

/// Collapse component allows you to toggle content on your pages with a bit of JavaScript and some
/// classes. Flexible component that utilizes a handful of classes (from the **required transitions
/// component**(*not yet implemented*)) for easy toggle behavior.
///
/// Base specifications: [bootstrap 3](http://getbootstrap.com/javascript/#collapse)
/// or [bootstrap 4](http://v4-alpha.getbootstrap.com/components/collapse/)
///
/// [demo](http://luisvt.github.io/ng2_strap/#collapse)
@Directive(selector: '[bsCollapse]',
    host: const {
      '[attr.aria-hidden]': '!expanded'
    })
class BsCollapseDirective {
  /// Constructs an collapsible component
  BsCollapseDirective(this.elementRef) {
    _element = elementRef;

    bsCollapseChange.listen((bsCollapse) {
      if (bsCollapse) {
        _hide();
      } else {
        _show();
      }
    });
  }

  /// Contains the element reference of this component
  HtmlElement elementRef;

  Element _element;

  /// provides the height style of the component in pixels
  @HostBinding('style.height')
  String height = '';

  /// if `true` the component is shown
  @HostBinding('class.show')
  @HostBinding('attr.aria-expanded')
  bool expanded = true;

  @HostBinding('class.collapse')
  bool collapsed = false;

  bool _collapsing = false;

  /// provides the animation state
  @HostBinding('class.collapsing')
  bool get collapsing => _collapsing;

  void set collapsing(bool collapsing) {
    _collapsing = collapsing;
    _collapsingChangeController.add(collapsing);
  }

  bool _bsCollapse = false;

  /// sets and fires the collapsed state of the component
  @Input() set bsCollapse(bool value) {
    _bsCollapse = value ?? false;
    _bsCollapseChangeController.add(_bsCollapse);
  }

  String get _scrollHeight => _element.scrollHeight.toString() + 'px';

  final _bsCollapseChangeController = new StreamController<bool>.broadcast();

  /// Emits the Collapse state of the component
  @Output() Stream<bool> get bsCollapseChange =>
      _bsCollapseChangeController.stream;

  final _collapsingChangeController = new StreamController<bool>.broadcast();

  /// Emits the collapsing state of the component
  @Output() Stream<bool> get collapsingChange =>
      _collapsingChangeController.stream;

  _hide() {
    expanded = false;
    height = _scrollHeight;
    collapsing = true;
    new Timer(const Duration(milliseconds: 10), () {
      height = '0';
      new Timer(const Duration(milliseconds: 350), () {
        collapsing = false;
        collapsed = true;
        height = '';
      });
    });
  }

  _show() {
    collapsed = false;
    height = '0';
    collapsing = true;
    new Timer(const Duration(milliseconds: 10), () {
      height = _scrollHeight;
      new Timer(const Duration(milliseconds: 350), () {
        collapsing = false;
        expanded = true;
        height = '';
      });
    });
  }
}