import 'dart:async';

import "package:angular2/angular2.dart";

@Directive(selector: "template[bsTemplateOutlet]")
class BsTemplateOutletDirective {
  ViewContainerRef _viewContainerRef;

  EmbeddedViewRef _insertedViewRef;

  BsTemplateOutletDirective(this._viewContainerRef);

  @Input() var ngOutletContext;

  @Input()
  set bsTemplateOutlet(TemplateRef templateRef) {
    new Future(() {
      if (this._insertedViewRef != null) {
        _viewContainerRef.remove(this._viewContainerRef.indexOf(this._insertedViewRef));
      }
      if (templateRef != null) {
        _insertedViewRef = _viewContainerRef.createEmbeddedView(templateRef);
        _insertedViewRef.setLocal('\$implicit', ngOutletContext);
      }
    });
  }
}