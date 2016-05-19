import "package:angular2/angular2.dart";

@Directive (selector: "n2s-transclude")
class N2sTransclude {
  ViewContainerRef viewRef;

  TemplateRef _templateRef;

  @Input()
  set templateRef(TemplateRef templateRef) {
    _templateRef = templateRef;
    if (templateRef != null) {
      viewRef.createEmbeddedView(templateRef);
    }
  }

  get templateRef => _templateRef;

  N2sTransclude(@Inject(ViewContainerRef) this.viewRef);
}