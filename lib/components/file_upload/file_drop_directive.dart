part of bs_file_upload;

@Directive(selector: 'bs-file-drop, [bsFileDrop]')
class BsFileDropDirective {
  final _fileOverCtrl = StreamController<bool>.broadcast();
  @Output() Stream<bool> get fileOver => _fileOverCtrl.stream;

  final _filesChangeCtrl = StreamController<List<File>>.broadcast();
  @Output() Stream<List<File>> get filesChange => _filesChangeCtrl.stream;

  @HostListener('drop', ['\$event'])
  void onDrop(MouseEvent event) {
    _preventAndStop(event);
    var transfer = event.dataTransfer;
    _fileOverCtrl.add(false);
    _filesChangeCtrl.add(transfer.files);
  }

  @HostListener ('dragover', ['\$event'])
  void onDragOver(MouseEvent event) {
    _preventAndStop(event);
    var transfer = event.dataTransfer;
    if (!transfer.types.contains('Files')) return;

    transfer.dropEffect = 'copy';
    _fileOverCtrl.add(true);
  }

  @HostListener ('dragleave', ['\$event'])
  void onDragLeave(Event event) {
    _preventAndStop(event);
    _fileOverCtrl.add(false);
  }

  void _preventAndStop(Event event) {
    event
      ..preventDefault()
      ..stopPropagation();
  }
}
