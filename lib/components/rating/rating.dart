import 'dart:async';
import 'package:angular/angular.dart';
import 'dart:html';
import 'package:js_shims/js_shims.dart';
import 'package:angular_forms/angular_forms.dart';


const RATING_VALUE_ACCESSOR = ExistingProvider.forToken(
  ngValueAccessor,
  BsRatingComponent,
);

/// Rating component that will take care of visualising a star rating bar
///
/// *Note*: Bootstrap 4 do not include glyphicons anymore, so if you want to continue use this font,
/// you will need to add a link to [`glyphicons.css`](https://github.com/valor-software/ng2-bootstrap/blob/master/demo/assets/css/glyphicons.css)
///
/// [demo](http://dart-league.github.io/ng_bootstrap/#accordion)
@Component (selector: 'bs-rating',
    templateUrl: 'rating.html',
    directives: [coreDirectives, formDirectives],
    providers: [RATING_VALUE_ACCESSOR])
class BsRatingComponent extends NumberValueAccessor implements OnInit {
  final HtmlElement element;
  BsRatingComponent(this.element) : super(null);

  /// maximum number of icons
  @Input() num max;

  ///
  @Input() List range;

  ///
  num value;

  ///
  num preValue;

  /// array of icons titles, default: (`["one", "two", "three", "four", "five"]`)
  @Input() List<String> titles;

  /// selected icon class
  @Input() String stateOn;

  /// unselected icon class
  @Input() String stateOff;

  /// if `true` will not react on any user events
  @Input() bool readonly;

  /// array of custom icons classes
  @Input() List ratingStates;

  final _onHoverCtrl = StreamController<int>.broadcast();

  /// fired when icon selected, emits the number equals to selected rating
  @Output() Stream<int> get onHover => _onHoverCtrl.stream;

  final _onLeaveCtrl = StreamController<int>.broadcast();

  /// fired when icon selected, emits the number equals to previous rating value
  @Output() Stream<int> get onLeave => _onLeaveCtrl.stream;

  /// initialize attributes
  @override
  void ngOnInit() {
    max ??= 5;
    readonly = readonly == true;
    stateOn ??= 'fas fa-star';
    stateOff ??= 'far fa-star';
    titles = titles != null && titles.isNotEmpty ? titles : ['one', 'two', 'three', 'four', 'five'];
    ratingStates ??= [];
    range = _buildTemplateObjects();
  }

  /// update model to view
  @override
  void writeValue(_value) {
    onChange((value = preValue = _value ??= 0));
  }

  /// build the template of the objects that will be rendered
  List _buildTemplateObjects() {
    var count = or(ratingStates.length, max);
    var result = [];
    for (var i = 0; i < count; i++) {
      result.add({
        'index': i,
        'stateOn': stateOn,
        'stateOff': stateOff,
        'title': titles.length > i ? titles[i] : i + 1,
      }
        ..addAll(ratingStates.length > i ? ratingStates[i] : {}));
    }
    return result;
  }

  /// change the value of the model
  void rate(num value) {
    if (!readonly && value >= 0 && value <= range.length) {
      writeValue(value);
    }
  }

  /// fired when a mouse enters to the icon, and it change the [value] of the rating
  void enter(num _value) {
    if (!readonly) {
      value = _value;
      _onHoverCtrl.add(_value);
    }
  }

  /// fired when the mouse leave the icon, and it resets the [value] of the rating
  void reset() {
    value = preValue;
    _onLeaveCtrl.add(value);
  }

  /// listen when the user does a key-down on the elements
  @HostListener('keydown', ['\$event'])
  void onKeydown(KeyboardEvent event) {
    if (![KeyCode.LEFT, KeyCode.UP, KeyCode.RIGHT, KeyCode.DOWN].contains(event.which)) {
      return;
    }
    event.preventDefault();
    event.stopPropagation();
    var sign = event.which == 38 || event.which == 39
        ? 1
        : -1;
    rate(value + sign);
  }

  @HostListener('change', ['\$event.target.value'])
  @HostListener('input', ['\$event'])
  bool onInput($event) => true;
}
