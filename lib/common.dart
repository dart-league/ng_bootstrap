import "package:angular2/angular2.dart";

@Directive (selector: "ngbs-transclude")
class NgBsTransclude {
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

  NgBsTransclude(@Inject(ViewContainerRef) this.viewRef);
}