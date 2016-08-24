import "package:angular2/angular2.dart";
import 'package:ng_bootstrap/components/modal/modal.dart';

@Component(selector: "modal-demo",
    templateUrl: "modal_demo.html",
    directives: const [BsModalComponent])
class ModalDemo {

  ModalAction modalAction;

  onModalClose(ModalAction _modalAction) {
    modalAction = _modalAction;
  }
}
