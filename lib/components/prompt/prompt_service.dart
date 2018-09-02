import 'dart:async';

import 'package:angular/angular.dart';

import '../modal/modal.dart';
import 'prompt.dart';
// ignore: uri_has_not_been_generated
import 'prompt.template.dart' as ng_prompt;

/// Service that creates a modal in the DOM
@Injectable()
class BsPromptService {
  final ApplicationRef _ar;

  BsPromptService(this._ar);

  /// Creates a modal with a simple text content
  Future<BsPromptComponent> call(String content, {String header, List<BsModalButton> buttons}) async {

    return (_ar.bootstrap(ng_prompt.BsPromptComponentNgFactory).instance as BsPromptComponent)
      ..header = header
      ..content = content
      ..buttons = buttons
      ..show();
  }

  ///Creates a modal with a component as content
  Future<BsPromptComponent> withComponent(ComponentFactory componentFactory,
      {String header, List<BsModalButton> buttons}) async {

    return (_ar.bootstrap(ng_prompt.BsPromptComponentNgFactory).instance as BsPromptComponent)
      ..header = header
      ..component = componentFactory
      ..buttons = buttons
      ..show();
  }
}
