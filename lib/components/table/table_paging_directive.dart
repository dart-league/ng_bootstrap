import "package:angular2/core.dart"
    show Directive, EventEmitter, Input, Output, HostListener;

@Directive(selector: "[bsTablePaging]")
class TablePagingDirective {
  @Input()
  bool ngTablePaging = true;
  @Output()
  EventEmitter<dynamic> tableChanged = new EventEmitter();
  @Input()
  dynamic get config {
    return this.ngTablePaging;
  }

  set config(dynamic value) {
    this.ngTablePaging = value;
  }

  @HostListener("pagechanged", const ["\$event"])
  void onChangePage(dynamic event) {
    // Object.assign(this.config, event);
    if (this.ngTablePaging) {
      this.tableChanged.emit({'paging': event});
    }
  }
}
