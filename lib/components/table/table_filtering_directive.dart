import "package:angular2/core.dart";

// import {setProperty} from 'angular2/ts/src/core/forms/directives/shared';
void setProperty(Renderer renderer, ElementRef elementRef, String propName,
    dynamic propValue) {
  renderer.setElementProperty(elementRef.nativeElement, propName, propValue);
}

@Directive(selector: "[bsTableFiltering]")
class TableFilteringDirective {
  @Input()
  Map bsTableFiltering = {"filterString": "", "columnName": "name"};
  @Output()
  EventEmitter<dynamic> tableChanged = new EventEmitter();
  @Input()
  dynamic get config {
    return this.bsTableFiltering;
  }

  set config(dynamic value) {
    this.bsTableFiltering = value;
  }

  ElementRef element;
  Renderer renderer;
  @HostListener("input", const ["\$event.target.value"])
  void onChangeFilter(dynamic event) {
    this.bsTableFiltering['filterString'] = event;
    this.tableChanged.emit({'filtering': this.bsTableFiltering});
  }

  TableFilteringDirective(ElementRef element, Renderer renderer) {
    this.element = element;
    this.renderer = renderer;
    // Set default value for filter
    setProperty(this.renderer, this.element, "value",
        this.bsTableFiltering['filterString']);
  }
}
