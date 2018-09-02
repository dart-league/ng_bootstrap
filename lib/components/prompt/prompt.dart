// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code

// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular/angular.dart';
import '../modal/modal.dart';

/// Shows a bootstrap modal dialog.
/// Set the body of the dialog by adding content to the modal tag: <modal>content here</modal>.
@Component(
    selector: 'bs-prompt',
    templateUrl: '../modal/modal.html',
    directives: const [coreDirectives])
class BsPromptComponent extends BsModalComponent {
  BsPromptComponent(ComponentLoader loader) : super(loader);
}
