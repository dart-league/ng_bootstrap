import "package:angular2/angular2.dart";
import 'package:angular2/src/facade/lang.dart';
import 'dart:async';

@Directive(selector: "template[bsTemplateOutlet]")
class BsTemplateOutletDirective {
  ViewContainerRef _viewContainerRef;

  EmbeddedViewRef _insertedViewRef;

  BsTemplateOutletDirective(this._viewContainerRef);

  @Input() var ngOutletContext;

  @Input()
  set bsTemplateOutlet(TemplateRef templateRef) {
    new Future(() {
      if (isPresent(this._insertedViewRef)) {
        _viewContainerRef.remove(this._viewContainerRef.indexOf(this._insertedViewRef));
      }
      if (isPresent(templateRef)) {
        _insertedViewRef = _viewContainerRef.createEmbeddedView(templateRef);
        _insertedViewRef.setLocal('\$implicit', ngOutletContext);
      }
    });
  }
}