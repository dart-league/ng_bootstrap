import 'dart:async';

import 'package:angular/angular.dart';

import '../modal/modal.dart';
import 'prompt.dart';

/// Service that creates a modal in the DOM
@Injectable()
class BsPromptService {
  final ComponentResolver _cr;
  final ApplicationRef _ar;

  BsPromptService(this._cr, this._ar);

  /// Creates a modal with a simple text content
  Future<BsPromptComponent> call(String content, {String header, List<BsModalButton> buttons}) async {
    // get the component factory from the type
    final cf = await _cr.resolveComponent(BsPromptComponent);

    return (_ar.bootstrap(cf).instance as BsPromptComponent)
      ..header = header
      ..content = content
      ..buttons = buttons
      ..show();
  }

//  /// Creates a modal with a component as content
//  BsPromptComponent createComponentModal(ViewContainerRef _location,
//      ComponentFactory contentComponent,
//      {String header, bool dismissable: true}) {
//    ComponentRef componentRef = _loader.loadNextTo(
//        bs_modal.NgPromptComponentNgFactory);
//    BsPromptComponent component = componentRef.instance;
//    component.header = header;
//    component.dismissable = dismissable;
//    component.contentComponent = contentComponent;
//    return component;
//  }
}
