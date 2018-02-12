import 'dart:math' as math;
import "package:angular/angular.dart";
import 'pager.dart';

/// Provide pagination links for your site or app with
/// the multi-page pagination component
@Component(selector: "bs-pagination",
    templateUrl: 'pagination.html',
    directives: const [CORE_DIRECTIVES])
class BsPaginationComponent extends BsPagerComponent implements OnInit {

  BsPaginationComponent() {
    // this line is temporal until `@HostListener` get fixed again
    currentPageChange.listen(onCurrentPageChange);
  }

//  /// css classes
//  @Input('class') String classes = "";

  /// limit number for page links in pager
  @Input() int maxSize;

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

  /// label of previous text
  @Input() String previousText = 'Previous';

  /// label of next text
  @Input() String nextText = 'Next';

  /// visible pages
  List<Map> pages = [];

  set totalPages(int v) {
    super.totalPages = v;
    if (currentPage > v) {
      selectPage(v);
    }
    onCurrentPageChange(currentPage);
  }

  ngOnInit() {
    totalPages = calculateTotalPages();
  }

  /// Create page object used in template
  makePage(number, text, isActive) {
    return { "number" : number, "text" : text, "active" : isActive};
  }

  /// get the pages to be viewed in dependence of the [currentPage] and [totalPage]
  getPages(int currentPage, int totalPages) {
    var pages = [];
    // Default page limits
    int startPage = 1;
    var endPage = totalPages;
    var isMaxSized = maxSize != null && maxSize < totalPages;
    // recompute if maxSize
    if (isMaxSized) {
      if (rotate) {
        // Current page is displayed in the middle of the visible ones
        startPage = math.max(currentPage - (maxSize / 2).floor(), 1);
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
        endPage = math.min(startPage + maxSize - 1, totalPages);
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
        pages.insert(0, previousPageSet);
      }
      if (endPage < totalPages) {
        var nextPageSet = makePage(endPage + 1, "...", false);
        pages.add(nextPageSet);
      }
    }
    return pages;
  }

//  @HostListener('currentPageChange', const ['\$event'])
  onCurrentPageChange(currentPage) =>
      pages = getPages(currentPage, totalPages);
}
