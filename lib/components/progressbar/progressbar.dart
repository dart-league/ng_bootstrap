import 'package:angular2/angular2.dart';
import 'dart:html';

/// Creates a progress component with multiple bars
///
/// Base specifications: [bootstrap 3](http://getbootstrap.com/components/#progress) or
/// [bootstrap 4](http://v4-alpha.getbootstrap.com/components/progress/)
///
/// [demo](http://luisvt.github.io/ng2_strap/#progress)
@Directive(selector: 'ngbs-progress',
    host: const {'[attr.max]' : 'max'})
class NgBsProgress implements OnInit {
  NgBsProgress();

  /// if `true` changing `value` of progress bar will be animated (*note*: not supported by Bootstrap 4)
  @Input() bool animate = true;

  /// provides the list of bars that this element contains
  List<NgBsBar> bars = [];

  num _max = 100;

  /// gets the maximum value of the bars
  num get max => _max;

  /// sets the maximum value of the bars
  @Input() set max(num v) {
    _max = v;
    bars.forEach((bar) {
      bar._recalculatePercentage();
    });
  }

  /// initialize the attributes
  ngOnInit() {
    animate ??= true;
    max = max ??= 100;
  }

  /// add a new bar at the last position
  addBar(NgBsBar bar) {
    if (!animate) {
      bar.transition = 'none';
    }
    bars.add(bar);
  }

  /// removes the specified bar
  removeBar(NgBsBar bar) {
    bars.remove(bar);
  }
}

/// Creates the bar that will be changing in the progress-bar element
///
/// [demo](http://luisvt.github.io/ng2_strap/#progress)
@Directive(selector: 'ngbs-bar',
    host: const {
      'style':'min-width: 0;',
      'role':'progressbar',
      '[style.width]':'(percent < 100 ? percent : 100).toString() + "%"',
      '[style.transition]': 'transition',
      'aria-valuemin':'0',
      '[attr.aria-valuenow]':'value',
      '[attr.aria-valuetext]':'percent.toStringAsFixed(0) + "%"',
      '[attr.aria-valuemax]':'max'
    })
class NgBsBar implements OnInit, OnDestroy {
  /// Constructs a [NgBsBar] injecting [progress] and [elementRef]
  NgBsBar(@Host() this.progress, this.elementRef);

  /// the element reference to the HTML DOM element
  ElementRef elementRef;

  /// container progress element
  NgBsProgress progress;

  /// value in percentage of the bar
  num percent = 0;

  /// transition class of the bar change
  String transition;

  /// maximum value of the bar
  num max;

  num _value;

  /// gets the current value of the bar
  num get value => _value;

  /// sets the current value of the bar
  @Input() set value(num v) {
    if (v == null || v == 0) {
      return;
    }
    _value = v;
    _recalculatePercentage();
  }

  /// sets the type of bar, it could be: `success`,`info`, `warning`, `danger`.
  @Input() set type(String type) {
    (elementRef.nativeElement as Element).classes.add(type);
  }

  /// add the bar to the progress container
  ngOnInit() {
    progress.addBar(this);
  }

  /// destroys the bars from the progress container
  ngOnDestroy() {
    progress.removeBar(this);
  }

  /// recalculates the percentage value
  _recalculatePercentage() {
    percent = 100 * value / progress.max;
    var totalPercentage = progress.bars.fold(0, (total, bar) {
      return total + bar.percent;
    });
    if (totalPercentage > 100) {
      percent -= totalPercentage - 100;
    }
  }
}

/// Provide up-to-date feedback on the progress of a workflow or action with simple yet
/// flexible progress bars.
///
/// Base specifications: [bootstrap 3](http://getbootstrap.com/components/#progress) or
/// [bootstrap 4](http://v4-alpha.getbootstrap.com/components/progress/)
///
/// [demo](http://luisvt.github.io/ng2_strap/#progress)
@Component (selector: 'ngbs-progressbar',
    templateUrl: 'progressbar.html',
    directives: const [NgBsProgress, NgBsBar])
class NgBsProgressbar {

  /// if `true` changing `value` of progress bar will be animated (*note*: not supported by Bootstrap 4)
  @Input() bool animate;

  /// maximum total value of progress element
  @Input() num max;

  /// provide one of the four supported contextual classes:
  /// `success`,`info`, `warning`, `danger`
  @Input() var type;

  /// current value of progress bar
  @Input() num value;
}

/// List of needed directives to create a progress-bar
const NGBS_PROGRESSBAR_DIRECTIVES = const [NgBsProgress, NgBsBar, NgBsProgressbar];