import 'dart:html';

import "package:angular2/core.dart";

// todo: filters
@Directive(selector: '[bsFileSelect]')
class BsFileSelectDirective {

  @Output() EventEmitter<List<File>> filesChange = new EventEmitter();

  @HostListener("change", const ['\$event'])
  onChange(Event event) {
    filesChange.emit((event.target as InputElement).files);
  }
}
