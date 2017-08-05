// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code

// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'package:angular/angular.dart';

/// Shows a bootstrap modal dialog.
/// Set the body of the dialog by adding content to the modal tag: <modal>content here</modal>.
@Component(
    selector: 'bs-modal',
    templateUrl: 'modal.html',
    directives: const [CORE_DIRECTIVES])
class BsModalComponent {

  @Input() String header;
  @Input() String cancelLabel = 'Cancel';
  @Input() String positiveLabel = 'OK';
  @Input() String negativeLabel = 'NO';
  @Input() List<String> actions = ['POSITIVE', 'CANCEL'];

  /// Fires an event when the modal is closed. The argument indicated how it was closed.
  /// @type {EventEmitter<ModalResult>}
  @Output() Stream<ModalAction> get close => _closeCtrl.stream;

  final _closeCtrl = new StreamController<ModalAction>.broadcast();

  bool showModal = false;

  BsModalComponent();

  /// Shows the modal. There is no method for hiding. This is done using actions of the modal itself.
  show() {
    showModal = true;
  }

  positiveAction() {
    showModal = false;
    _closeCtrl.add(ModalAction.POSITIVE);
    return false;
  }

  negativeAction() {
    showModal = false;
    _closeCtrl.add(ModalAction.NEGATIVE);
    return false;
  }

  cancelAction() {
    showModal = false;
    _closeCtrl.add(ModalAction.CANCEL);
    return false;
  }
}

/// The possible reasons a modal has been closed.
enum ModalAction { POSITIVE, NEGATIVE, CANCEL }