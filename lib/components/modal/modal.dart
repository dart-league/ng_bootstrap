// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code

// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/angular2.dart';

/**
 * Shows a bootstrap modal dialog.
 * Set the body of the dialog by adding content to the modal tag: <modal>content here</modal>.
 */
@Component(
    selector: 'bs-modal',
    templateUrl: 'modal.html')
class Modal {

  @Input() String header;
  @Input() String cancelLabel = 'Cancel';
  @Input() String positiveLabel = 'OK';
  @Input() String negativeLabel = 'NO';
  @Input() List<String> actions = ['POSITIVE', 'CANCEL'];

  /**
   * Fires an event when the modal is closed. The argument indicated how it was closed.
   * @type {EventEmitter<ModalResult>}
   */
  @Output() EventEmitter<ModalAction> close = new EventEmitter<ModalAction> ();

  bool showModal = false;

  Modal() {
    print('showModal = $showModal');
  }

  /**
   * Shows the modal. There is no method for hiding. This is done using actions of the modal itself.
   */
  show() {
    showModal = true;
  }

  positiveAction() {
    showModal = false;
    close.emit(ModalAction.POSITIVE);
    return false;
  }

  negativeAction() {
    showModal = false;
    close.emit(ModalAction.NEGATIVE);
    return false;
  }

  cancelAction() {
    showModal = false;
    close.emit(ModalAction.CANCEL);
    return false;
  }
}

/**
 * The possible reasons a modal has been closed.
 */
enum ModalAction { POSITIVE, NEGATIVE, CANCEL }