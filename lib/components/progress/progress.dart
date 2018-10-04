import 'dart:async';
import 'dart:html';

import 'package:angular/angular.dart';

/// Creates a progress component
///
/// Base specifications: [bootstrap 4](http://v4-alpha.getbootstrap.com/components/progress/)
///
/// [demo](http://dart-league.github.io/ng_bootstrap/build/web/#progress)
@Component(
    selector: 'bs-progress',
    template: '''
<div class="progress-bar"
     role="progressbar"
     aria-valuenow="0"
     aria-valuemin="0"
     aria-valuemax="100"
     [style.width]="percentage">
  <div [style.width]="elementWidth">
    <template [ngTemplateOutlet]="labelTemplate"
              [ngTemplateOutletContext]="{\$implicit: percentage, value: value, max: max}"></template>
  </div>
</div>
<template [ngTemplateOutlet]="labelTemplate" [ngTemplateOutletContext]="{\$implicit: percentage}"></template>''',
    directives: const [coreDirectives])
class BsProgressComponent implements OnInit, OnDestroy {
  /// if `true` changing `value` of progress bar will be animated (*note*: not supported by Bootstrap 4)
  @Input()
  bool animate = true;

  /// maximum value of the bar
  @Input()
  num max;

  /// value of the progress bar
  @Input()
  num value;

  String get percentage => (value / max * 100).toString() + '%';

  @ContentChild(TemplateRef)
  TemplateRef labelTemplate;

  /// Handles the width of the element
  String elementWidth;

  HtmlElement _elementRef;

  Timer _resizeTimer;

  BsProgressComponent(this._elementRef);

  /// initialize the attributes
  ngOnInit() {
    animate ??= true;
    max = max ??= 100;
    Element nativeElement = _elementRef;
    elementWidth = nativeElement.getComputedStyle().width;
    // TODO: change this event something else
//    window.onResize.listen((e) {
//      elementWidth = nativeElement.getComputedStyle().width;
//    });
    _resizeTimer =
        Timer.periodic(Duration(milliseconds: 500), (_) => elementWidth = nativeElement.getComputedStyle().width);
  }

  @override
  void ngOnDestroy() {
//    _resizeTimer.cancel();
  }
}
