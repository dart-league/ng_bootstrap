import 'dart:async';

import "package:angular/angular.dart";
import 'package:ng_bootstrap/ng_bootstrap.dart';

@Component (selector: "prompt-demo",
    templateUrl: "prompt_demo.html",
    directives: const [BsProgressComponent, coreDirectives],
    providers: const [BsPromptService])
class PromptDemo {

  String modalAction;

  final BsPromptService _prompt;

  @ViewChild('location', read: ViewContainerRef) ViewContainerRef location;

  PromptDemo(this._prompt);

  showModal() async {
    (await _prompt('Test content', buttons: [
      new BsModalButton('Save', onClick: () {
        print('saving');
        return 'SAVE';
      }),
      new BsModalButton('cancel', cssClasses: 'btn-secondary', onClick: () {
        print('cancelling');
        return new Future.delayed(const Duration(seconds: 2), () => 'CANCEL');
      })
    ])).close.listen((_modalAction) => modalAction = _modalAction);
  }
}
