part of bs_file_upload;

// todo: filters
@Directive(selector: '[bsFileSelect]')
class BsFileSelectDirective {

  final _filesChangeCtrl = new StreamController<List<File>>.broadcast();
  @Output() Stream<List<File>> get filesChange => _filesChangeCtrl.stream;

  @HostListener("change", const ['\$event'])
  onChange(Event event) {
    _filesChangeCtrl.add((event.target as InputElement).files);
  }
}
