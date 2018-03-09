import 'dart:async';
import 'dart:html';
import 'dart:math' as math;
import "package:angular/angular.dart";

/// Quick "previous" and "next" links for simple
/// pagination implementations with light markup and styles.
/// It’s great for simple sites like blog or magazines.
@Component (selector: "bs-pager",
    templateUrl: 'pager.html',
    directives: const [coreDirectives])
class BsPagerComponent {

  /// label of previous text
  @Input() String previousText = "« Previous";

  /// label of next text
  @Input() String nextText = "Next »";

  /// if `true` aligns each link to the sides of pager
  @Input() bool align = true;

  /// if `true` the pagination component is disabled and cannot be used.
  @Input() bool disabled = false;

  int _currentPage = 1;

  /// gets the index of selected page
  int get currentPage => _currentPage;

  /// sets the index of selected page
  @Input() set currentPage(num value) {
    _currentPage = value ?? 1;
    _currentPageChangeCtrl.add(_currentPage);
  }

  final _currentPageChangeCtrl = new StreamController<int>.broadcast();

  /// emits that the current page has changed
  @Output() Stream<int> get currentPageChange => _currentPageChangeCtrl.stream;

  int _totalPages = 10;

  /// gets the number of total pages
  int get totalPages => _totalPages;

  /// sets the number of total pages
  set totalPages(int v) {
    _totalPages = v;
    _totalPagesChangeCtrl.add(v);
  }

  final _totalPagesChangeCtrl = new StreamController<int>.broadcast();

  /// emits that the total pages value has changed
  @Output() Stream<int> get totalPagesChange => _totalPagesChangeCtrl.stream;

  int _itemsPerPage = 10;

  /// gets the maximum number of items per page. If value less than 1 will display all items on one page
  get itemsPerPage => _itemsPerPage;

  /// sets the maximum number of items per page. If value less than 1 will display all items on one page
  @Input() set itemsPerPage(int v) {
    _itemsPerPage = v;
    totalPages = calculateTotalPages();
  }

  int _totalItems = 10;

  /// gets the total items per page
  int get totalItems => _totalItems;

  /// sets the total items per page
  @Input() set totalItems(int v) {
    _totalItems = v;
    totalPages = calculateTotalPages();
  }

  /// calculates total pages
  num calculateTotalPages() {
    var totalPages = itemsPerPage < 1 ? 1 : (totalItems / itemsPerPage).ceil();
    return math.max(totalPages ?? 0, 1);
  }

  /// checks if there is no previous page
  noPrevious() => currentPage <= 1;

  /// checks if there is no next page
  noNext() => currentPage >= totalPages;

  /// sets clicked item as selected
  selectPage(num _page, [MouseEvent event]) {
    if (event != null) {
      event.preventDefault();
    }
    if ((!disabled || event == null)
        && currentPage != _page
        && _page > 0
        && _page <= totalPages) {
      dynamic target = event.target;
      target.blur();
      currentPage = _page;
      _totalPagesChangeCtrl.add(totalPages);
    }
  }
}
