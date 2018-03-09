// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code

// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'package:angular/angular.dart';

/// Shows a bootstrap modal dialog.
/// Set the body of the dialog by adding content to the modal tag: <modal>content here</modal>.
@Component(
    selector: 'bs-modal',
    templateUrl: 'modal.html',
    directives: const [coreDirectives])
class BsModalComponent {

  @Input() String header;
  String content;
  List<BsModalButton> _buttons;

  List<BsModalButton> get buttons => _buttons;

  bool loading = false;

  @Input() void set buttons(List/* <BsModalButton | Map> */ buttons) {
    _buttons = buttons.map((button) =>
      button is Map
        ? new BsModalButton(
            button['label'],
            id: button['id'],
            cssClasses: button['cssClasses'] ?? 'btn-primary',
            onClick: button['onClick'])
        : button
    ).toList();
  }

  /// Fires an event when the modal is closed. The argument indicated how it was closed.
  /// @type {EventEmitter<ModalResult>}
  @Output() Stream<String> get close => _closeCtrl.stream;

  final _closeCtrl = new StreamController<String>.broadcast();

  bool showModal = false;

  /// Shows the modal. There is no method for hiding. This is done using actions of the modal itself.
  show() {
    showModal = true;
  }

  hide([BsModalButton button]) async {
    loading = true;
    _closeCtrl.add(await button?.onClick?.call());
    showModal = false;
    loading = false;
    return false;
  }
}

/// Simple class to save all the modal button variables
class BsModalButton {
  final String label;
  final String id;
  final String cssClasses;
  final Function/* () => Future<String> | String */ onClick;

  const BsModalButton(this.label, {this.id, this.cssClasses = 'btn-primary', this.onClick});
}
