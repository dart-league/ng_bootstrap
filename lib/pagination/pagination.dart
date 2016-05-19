library pagination;

import "package:angular2/angular2.dart";
import 'dart:html';
import 'dart:math';
import 'package:node_shims/js.dart';

part 'pager.dart';

/// **Pager** - quick previous and next links for simple pagination implementations with light
/// markup and styles. It's great for simple sites like blogs or magazines.
///
/// [demo](http://luisvt.github.io/ng2_strap/#pagination)
@Component(selector: "n2s-pagination",
    templateUrl: 'pagination.html',
    inputs: const [
      'previousText',
      'nextText',
      'align',
      'disabled',
      'currentPage',
      'itemsPerPage',
      'totalItems'
    ],
    outputs: const [
      'totalPagesChange',
      'currentPageChange'
    ])
class N2sPagination extends N2sPager implements OnInit {
  /// Constructor to create a new Pagination component in which [elementRef] is injected.
  N2sPagination(ElementRef elementRef) : super(elementRef);

  /// css classes
  @Input('class') String classes = "";

  /// limit number for page links in pager
  @Input() num maxSize;

  /// if `true` current page will be in the middle of pages list
  @Input() bool rotate = true;

  /// if true shows the direction buttons
  @Input() bool directionLinks = true;

  /// if `false` first and last buttons will be hidden
  @Input() dynamic boundaryLinks = true;

  /// label of first text
  @Input() String firstText = "First";

  /// label of last text
  @Input() String lastText = "Last";

  /// visible pages
  List<Map> pages = [];

  set totalPages(int v) {
    super.totalPages = v;
    if (currentPage > v) {
      selectPage(v);
    }
  }

  ngOnInit() {
//    classes = elementRef.nativeElement.getAttribute("class") ?? "";
    totalPages = _calculateTotalPages();
//    currentPageEmitter.emit(currentPage);
  }

  /// Create page object used in template
  makePage(number, text, isActive) {
    return { "number" : number, "text" : text, "active" : isActive};
  }

  /// get the pages to be viewed in dependence of the [currentPage] and [totalPage]
  getPages(currentPage, totalPages) {
    var pages = [];
    // Default page limits
    var startPage = 1;
    var endPage = totalPages;
    var isMaxSized = maxSize != null && maxSize < totalPages;
    // recompute if maxSize
    if (isMaxSized) {
      if (rotate) {
        // Current page is displayed in the middle of the visible ones
        startPage = max(currentPage - (maxSize / 2).floor(), 1);
        endPage = startPage + maxSize - 1;
        // Adjust if limit is exceeded
        if (endPage > totalPages) {
          endPage = totalPages;
          startPage = endPage - maxSize + 1;
        }
      } else {
        // Visible pages are paginated with maxSize
        startPage = (((currentPage / maxSize).ceil() - 1) * maxSize) + 1;
        // Adjust last page if limit is exceeded
        endPage = min(startPage + maxSize - 1, totalPages);
      }
    }
    // Add page number links
    for (var number = startPage; number <= endPage; number ++) {
      var page = makePage(number, number, number == currentPage);
      pages.add(page);
    }
    // Add links to move between page sets
    if (isMaxSized && !rotate) {
      if (startPage > 1) {
        var previousPageSet = makePage(startPage - 1, "...", false);
        unshift(pages, previousPageSet);
      }
      if (endPage < totalPages) {
        var nextPageSet = makePage(endPage + 1, "...", false);
        push(pages, nextPageSet);
      }
    }
    return pages;
  }

  @HostListener('currentPageChange', const ['\$event'])
  onCurrentPageChange(currentPage) =>
      pages = getPages(currentPage, totalPages);
}

const PAGINATION_DIRECTIVES = const [N2sPagination, N2sPager];