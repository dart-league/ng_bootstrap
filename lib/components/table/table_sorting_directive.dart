import 'dart:html';
import "package:angular2/core.dart"
    show Directive, EventEmitter, Input, Output, HostListener;
import 'package:node_shims/js.dart';

@Directive(selector: "[bsTableSorting]")
class TableSortingDirective {
  @Input()
  dynamic bsTableSorting;
  @Input()
  dynamic column;
  @Output()
  EventEmitter<dynamic> sortChanged = new EventEmitter();
  @Input()
  dynamic get config {
    return this.bsTableSorting;
  }

  set config(dynamic value) {
    this.bsTableSorting = value;
  }

  @HostListener("click", const ["\$event"])
  void onToggleSort(MouseEvent event) {
    if (event != null) {
      event.preventDefault();
    }
    if (this.bsTableSorting &&
        truthy(this.column) &&
        !identical(this.column['sort'], false)) {
      switch (this.column['sort']) {
        case "asc":
          this.column['sort'] = "desc";
          break;
        case "desc":
          this.column['sort'] = "";
          break;
        default:
          this.column['sort'] = "asc";
          break;
      }
      this.sortChanged.emit(this.column);
    }
  }
}
