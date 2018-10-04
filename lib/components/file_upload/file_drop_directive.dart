part of bs_file_upload;

@Directive(selector: 'bs-file-drop, [bsFileDrop]')
class BsFileDropDirective {
  final _fileOverCtrl = new StreamController<bool>.broadcast();
  @Output() Stream<bool> get fileOver => _fileOverCtrl.stream;

  final _filesChangeCtrl = new StreamController<List<File>>.broadcast();
  @Output() Stream<List<File>> get filesChange => _filesChangeCtrl.stream;

  @HostListener('drop', const ['\$event'])
  void onDrop(MouseEvent event) {
    _preventAndStop(event);
    var transfer = event.dataTransfer;
    _fileOverCtrl.add(false);
    _filesChangeCtrl.add(transfer.files);
  }

  @HostListener ('dragover', const ['\$event'])
  void onDragOver(MouseEvent event) {
    _preventAndStop(event);
    var transfer = event.dataTransfer;
    if (!transfer.types.contains('Files')) return;

    transfer.dropEffect = 'copy';
    _fileOverCtrl.add(true);
  }

  @HostListener ('dragleave', const ['\$event'])
  onDragLeave(Event event) {
    _preventAndStop(event);
    _fileOverCtrl.add(false);
  }

  _preventAndStop(Event event) {
    event
      ..preventDefault()
      ..stopPropagation();
  }
}