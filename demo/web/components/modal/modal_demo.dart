import 'dart:async';

import 'package:angular/angular.dart';
import 'package:ng_bootstrap/components/modal/modal.dart';

@Component(
    selector: 'modal-demo',
    templateUrl: 'modal_demo.html',
    directives: [BsModalComponent])
class ModalDemo {
  String modalAction;
  List<Map<String, dynamic>> get buttons => [
    {'label': 'Save', 'onClick': handleSave},
    {'label': 'Cancel', 'onClick': handleCancel, 'cssClasses': 'btn-secondary'}
  ];

  void onModalClose(String _modalAction) {
    modalAction = _modalAction;
    print('modalAction: $modalAction');
  }

  String handleSave() {
    print('saving');
    return 'SAVE';
  }

  Future<String> handleCancel() {
    print('cancelling');
    return Future.delayed(Duration(seconds: 2), () => 'CANCEL');
  }
}
