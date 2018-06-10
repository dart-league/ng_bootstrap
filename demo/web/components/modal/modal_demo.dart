import 'dart:async';

import "package:angular/angular.dart";
import 'package:ng_bootstrap/components/modal/modal.dart';

@Component(selector: "modal-demo",
    templateUrl: "modal_demo.html",
    directives: const [BsModalComponent])
class ModalDemo {

  String modalAction;

  onModalClose(String _modalAction) {
    modalAction = _modalAction;
    print('modalAction: $modalAction');
  }

  List<BsModalButton> buttons = <BsModalButton>[
    new BsModalButton("Save",onClick: handleSave),
    new BsModalButton("Cancel",onClick: handleCancel)
  ];

  static String handleSave() {
    print('saving');
    return 'SAVE';
  }

  static Future<String> handleCancel() {
    print('cancelling');
    return new Future.delayed(const Duration(seconds: 2), () => 'CANCEL');
  }
}
