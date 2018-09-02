import "package:angular/angular.dart";

import "package:js_shims/js_shims.dart";
import 'dart:async';

/// List of Directives needed to create a carousel
const bsCarouselComponents = const [BsCarouselComponent, BsSlideComponent];

@Deprecated('Renamed to "bsCarouselComponents"')
const NG_BOOTSTRAP_CAROUSEL_DIRECTIVES = bsCarouselComponents;

/// Provides the direction of the Carousel
enum Direction { UNKNOWN, NEXT, PREV }

/// A slideshow component for cycling through elements—images or slides of text—like a carousel.
/// *Nested carousels are not supported.*
///
/// Base specifications: [bootstrap 3](http://getbootstrap.com/javascript/#carousel) or
/// [bootstrap 4](http://v4-alpha.getbootstrap.com/components/carousel/)
///
/// [demo](http://dart-league.github.io/ng_bootstrap/#carousel)
@Component(selector: "bs-carousel", templateUrl: 'carousel.html', directives: const [coreDirectives])
class BsCarouselComponent implements OnDestroy, AfterContentInit {
  /// if `true` will disable pausing on carousel mouse hover
  @Input() bool noPause = false;

  /// if `true` the carousel will not cycle continuously and will have hard stops (prevent looping)
  @Input() bool noWrap;

  /// if `true` the carousel is not going to have transitions between slides
  @Input() bool noTransition;

  /// provides the slides of the carousel
  @ContentChildren(BsSlideComponent)
  List<BsSlideComponent> slides = [];

  /// the interval of time of the current slide
  Timer currentInterval;

  /// check if the carousel is playing, in that case slides are changing
  bool isPlaying = false;

  /// checks if the carousel is destroyed
  bool destroyed = false;

  /// currently active slide
  BsSlideComponent currentSlide;

  /// amount of time in milliseconds to delay between automatically cycling an item. If `false`, carousel will not automatically cycle
  @Input() num interval;

  @override
  ngAfterContentInit() {
    play();
  }

  /// Listen when the Carousel is destroyed
  ngOnDestroy() {
    destroyed = true;
  }

  /// listen when an slide is selected
  select(BsSlideComponent nextSlide, [Direction direction = Direction.UNKNOWN]) {
    var nextIndex = nextSlide.index;
    if (identical(direction, Direction.UNKNOWN)) {
      direction = nextIndex > getCurrentIndex() ? Direction.NEXT : Direction.PREV;
    }
    // Prevent this user-triggered transition from occurring if there is already one in progress
    if (nextSlide != null && nextSlide != currentSlide) {
      goNext(nextSlide, direction);
    }
  }

  /// go to next slide after being selected
  goNext(BsSlideComponent slide, Direction direction) {
    if (destroyed) {
      return;
    }
    slide.direction = direction;
    slide.active = true;
    if (currentSlide != null) {
      currentSlide.direction = direction;
      currentSlide.active = false;
    }
    currentSlide = slide;
    // every time you change slides, reset the timer
    restartTimer();
  }

  /// gets the slide by index
  getSlideByIndex(num index) {
    var len = slides.length;
    for (var i = 0; i < len; ++i) {
      if (identical(slides[i].index, index)) {
        return slides[i];
      }
    }
  }

  /// gets the index of the current selected slide
  int getCurrentIndex() {
    return falsey(currentSlide) ? 0 : currentSlide.index;
  }

  /// listen when a user wants to go to next slide
  next() {
    var newIndex = (getCurrentIndex() + 1) % slides.length;
    if (identical(newIndex, 0) && noWrap) {
      pause();
      return null;
    }
    return select(getSlideByIndex(newIndex), Direction.NEXT);
  }

  /// listen when a user wants to go to a previous slide
  prev() {
    var newIndex = getCurrentIndex() - 1 < 0 ? slides.length - 1 : getCurrentIndex() - 1;
    if (noWrap && identical(newIndex, slides.length - 1)) {
      pause();
      return null;
    }
    return select(getSlideByIndex(newIndex), Direction.PREV);
  }

  /// restart the timer of the slides
  restartTimer() {
    resetTimer();
    var intervalAux = interval.toInt();
    if (intervalAux != double.nan && intervalAux > 0) {
      currentInterval = new Timer(new Duration(milliseconds: intervalAux), () {
        var nInterval = interval;
        if (isPlaying && intervalAux != double.nan && nInterval > 0 && truthy(slides.length)) {
          next();
        } else {
          pause();
        }
      });
    }
  }

  /// stops the slides timer and reset its value
  resetTimer() {
    if (truthy(currentInterval)) {
      currentInterval.cancel();
      currentInterval = null;
    }
  }

  /// starts the slides timer
  play() {
    if (!isPlaying) {
      isPlaying = true;
      restartTimer();
    }
  }

  /// event group name which pauses the cycling of the carousel, if `hover` pauses on mouseenter and resumes on mouseleave
  pause() {
    if (!noPause) {
      isPlaying = false;
      resetTimer();
    }
  }

  /// add an slide to the carousel
  addSlide(BsSlideComponent slide) {
    slide.index = slides.length;
    slides.add(slide);
  }

  /// removes an slide to the carousel
  removeSlide(BsSlideComponent slide) {
    splice(slides, slide.index, 1);
    if (identical(slides.length, 0)) {
      currentSlide = null;
      return;
    }
    for (var i = 0; i < slides.length; i++) {
      slides[i].index = i;
    }
  }
}

/// Creates the slide element that will be displayed in the carousel
///
/// [demo](http://dart-league.github.io/ng_bootstrap/#carousel)
@Component(
    selector: "bs-slide",
    template: '''
  <div class="text-center">
    <ng-content></ng-content>
  </div>
  ''',
    directives: const [NgClass])
class BsSlideComponent {
  /// Constructs a new slide injecting the parent carousel
  BsSlideComponent();

  /// if `true` the slide is been showed
  @Input()
  @HostBinding('class.active')
  bool active = false;

  /// provides the direction of the slides
  @Input()
  Direction direction;

  /// provides the position of the slide
  @Input()
  num index;
}
