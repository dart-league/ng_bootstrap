// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code

// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart';

/// Shows a bootstrap modal dialog.
/// Set the body of the dialog by adding content to the modal tag:
///
///     <bs-modal>content here</bs-modal>
///
@Component(
    selector: 'bs-modal',
    templateUrl: 'modal.html',
    directives: const [coreDirectives])
class BsModalComponent {

  @Input() String header;
  String content;
  List<BsModalButton> _buttons;

  BsModalComponent(this._loader);

  List<BsModalButton> get buttons => _buttons;

  bool loading = false;

  @Input() void set buttons(List/* <BsModalButton | Map> */ buttons) {
    _buttons = buttons.map<BsModalButton>((button) =>
    button is Map
        ? new BsModalButton(
            button['label'],
            id: button['id'],
            cssClasses: button['cssClasses'] ?? 'btn-primary',
            onClick: button['onClick'])
        : button
    ).toList();
  }

  final ComponentLoader _loader;

  @ViewChild('contentRef', read: ViewContainerRef)
  ViewContainerRef contentRef;

  ComponentRef _component;

  /// Adds a component to the modal
  ///
  /// Creates a modal with the reference [contentRef], if a [_component] already
  /// exist it will be destroyed to avoid creating components
  @Input()
  set component(ComponentFactory component){
    if(component!=null){
      if(_component != null){
        _component.destroy();
      }
      _component = _loader.loadNextToLocation(component, contentRef);
    }
  }

  ComponentRef get componentRef => _component;

  /// Fires an event when the modal is closed. The argument indicated how it was closed.
  /// @type {EventEmitter<ModalResult>}
  @Output() Stream<String> get close => _closeCtrl.stream;

  final _closeCtrl = new StreamController<String>.broadcast();

  bool showModal = false;

  /// Shows the modal. There is no method for hiding. This is done using actions of the modal itself.
  void show() {
    showModal = true;
    document.body.classes.add('modal-open');
  }

  Future<bool> hide([BsModalButton button]) async {
    loading = true;
    _closeCtrl.add(await button?.onClick?.call());
    showModal = false;
    loading = false;
    document.body.classes.remove('modal-open');
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
