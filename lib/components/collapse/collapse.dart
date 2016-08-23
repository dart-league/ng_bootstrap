import 'dart:html';
import 'package:angular2/angular2.dart';
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
      '[class.collapse]' : '!collapsing',
      '[attr.aria-hidden]': '!expanded'
    })
class Collapse implements OnInit {
  /// Constructs an collapsible component
  Collapse(this.elementRef);

  /// Contains the element reference of this component
  ElementRef elementRef;

  // TODO: try to use scroll values instead saving auxiliary value
  /// Auxiliary variable to saves original height of the component
  String _originalHeight;

  /// provides the height style of the component in pixels
  @HostBinding('style.height')
  String height;

  /// if `true` the component is shown
  @HostBinding('class.in')
  @HostBinding('attr.aria-expanded')
  bool expanded = true;

  /// provides the animation state
  @HostBinding('class.collapsing')
  bool collapsing = false;

  /// sets and fires the collapsed state of the component
  @Input() set bsCollapse(bool value) {
    if (value ?? false) {
      _hide();
    } else {
      _show();
    }
  }

  /// Emits the Collapse state of the component
  @Output() EventEmitter<bool> bsCollapseChange = new EventEmitter<bool>();

  /// Emits the collapsing state of the component
  @Output() EventEmitter<bool> collapsingChange = new EventEmitter<bool>();

  /// Initialize the [Collapse] [height] value
  ngOnInit() {
    height = _originalHeight = (elementRef.nativeElement as Element).getComputedStyle().height;
  }

  _hide() {
    if (!expanded && !collapsing) return;

    collapsingChange.emit(collapsing = true);
    height = '0';
    new Timer(const Duration(milliseconds: 350), () {
      expanded = false;
      collapsingChange.emit(collapsing = false);
      bsCollapseChange.emit(!expanded);
    });
  }

  _show() {
    if (expanded && !collapsing) return;

    collapsingChange.emit(collapsing = true);
    expanded = true;
    new Future(() {
      height = _originalHeight;
      new Timer(const Duration(milliseconds: 350), () {
        collapsingChange.emit(collapsing = false);
        bsCollapseChange.emit(!expanded);
      });
    });
  }
}