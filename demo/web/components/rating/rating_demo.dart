import "package:angular/angular.dart";
import 'package:angular_forms/angular_forms.dart';
import "package:ng_bootstrap/components/rating/rating.dart";

@Component(selector: "rating-demo",
    templateUrl: "rating_demo.html",
    directives: const [BsRatingComponent, coreDirectives, formDirectives])
class RatingDemo {
  num x = 5;
  num y = 2;
  num max = 10;
  num rate = 7;
  bool isReadonly = false;
  num overStar;
  num percent = 0;
  var ratingStates = [
    {"stateOn": "fa-check", "stateOff": "fa-circle"},
    {"stateOn": "fa-star", "stateOff": "fa-star-o"},
    {"stateOn": "fa-heart", "stateOff": "fa-ban"},
    {"stateOn": "fa-heart"},
    {"stateOff": "fa-power-off"}
  ];
  void hoveringOver(num value) {
    overStar = value;
    percent = 100 * (value / this.max);
  }

  resetStar() {
    overStar = null;
  }
}
