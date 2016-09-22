import 'dart:html';

import 'package:angular2/core.dart';

@Directive(selector: 'bs-file-drop, [bsFileDrop]')
class BsFileDropDirective {
  @Output() EventEmitter<bool> fileOver = new EventEmitter();

  @Output() EventEmitter<List<File>> filesChange = new EventEmitter();

  @HostListener('drop', const ['\$event'])
  void onDrop(MouseEvent event) {
    _preventAndStop(event);
    var transfer = event.dataTransfer;
    fileOver.emit(false);
    filesChange.emit(transfer.files);
  }

  @HostListener ('dragover', const ['\$event'])
  void onDragOver(MouseEvent event) {
    _preventAndStop(event);
    var transfer = event.dataTransfer;
    if (!transfer.types.contains('Files')) return;

    transfer.dropEffect = 'copy';
    fileOver.emit(true);
  }

  @HostListener ('dragleave', const ['\$event'])
  onDragLeave(Event event) {
    _preventAndStop(event);
    fileOver.emit(false);
  }

  _preventAndStop(Event event) {
    event
      ..preventDefault()
      ..stopPropagation();
  }
}