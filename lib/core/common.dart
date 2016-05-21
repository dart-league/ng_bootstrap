import "package:angular2/angular2.dart";

@Directive (selector: "bs-transclude")
class Transclude {
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

  Transclude(@Inject(ViewContainerRef) this.viewRef);
}