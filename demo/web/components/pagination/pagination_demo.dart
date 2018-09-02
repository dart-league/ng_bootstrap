import "package:angular/angular.dart";
import 'package:ng_bootstrap/ng_bootstrap.dart';

@Component(selector: "pagination-demo",
    templateUrl: "pagination_demo.html",
    directives: const [BsPaginationComponent, BsPagerComponent])
class PaginationDemo {
  int totalItems = 64;
  int currentPage = 4;
  int maxSize = 5;
  int bigTotalItems = 175;
  int bigCurrentPage = 1;
  int smallnumPages;
  int numPages;

  void setPage(int pageNo) {
    currentPage = pageNo;
  }

//  void pageChanged() {
//    print("Page changed to: $currentPage");
//  }
}
