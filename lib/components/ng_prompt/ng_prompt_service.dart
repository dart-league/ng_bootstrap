import 'package:angular/angular.dart';
import 'package:ng_bootstrap/components/ng_prompt/ng_prompt.dart';

// ignore: uri_has_not_been_generated
import 'package:ng_bootstrap/components/ng_prompt/ng_prompt.template.dart' as ng_prompt;

///Service tath creates a modal in the DOM
@Injectable()
class NgPromptService {
  final ComponentLoader _loader;

  NgPromptService(this._loader);


  ///Creates a modal
  ///
  ///Creates a modal with a simple text content
  NgPromptComponent createSimpleModal(ViewContainerRef _location,
      {String header, bool dismissable: true, String content}) {
    ComponentRef componentRef = _loader.loadNextTo(
        ng_prompt.NgPromptComponentNgFactory);
    NgPromptComponent component = componentRef.instance;
    component.header = header;
    component.dismissable = dismissable;
    component.textContent = content;
    return component;
  }

  ///Creates a modal
  ///
  ///Creates a modal with a component as content
  NgPromptComponent createComponentModal(ViewContainerRef _location,
      ComponentFactory contentComponent,
      {String header, bool dismissable: true}) {
    ComponentRef componentRef = _loader.loadNextTo(
        ng_prompt.NgPromptComponentNgFactory);
    NgPromptComponent component = componentRef.instance;
    component.header = header;
    component.dismissable = dismissable;
    component.contentComponent = contentComponent;
    return component;
  }
}