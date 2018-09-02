import "package:angular/angular.dart";
import 'package:angular_forms/angular_forms.dart';
import 'package:ng_bootstrap/components/carousel/carousel.dart';

@Component(selector: "carousel-demo",
    templateUrl: "carousel_demo.html",
    directives: const [bsCarouselComponents, coreDirectives, formDirectives])
class CarouselDemo {
  num myIntervalInSeconds = 1;
  num get myIntervalInMs => myIntervalInSeconds * 1000;
  bool noWrapSlides = false;
  List slides = [];
  CarouselDemo() {
    for (var i = 0; i < 4; i++) {
      addSlide();
    }
  }

  addSlide() {
    var newWidth = 600 + slides.length + 1;
    slides.add({
        'image': '''//placekitten.com/${newWidth}/300''',
        'text': '''
${["More" , "Extra" , "Lots of" , "Surplus"][slides.length % 4]}
${["Cats" , "Kittys" , "Felines" , "Cutes"][slides.length % 4]}'''
    });
  }

  removeSlide(index) {
    slides.removeAt(index);
  }
}
