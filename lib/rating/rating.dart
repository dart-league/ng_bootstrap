import "package:angular2/angular2.dart";
import 'dart:html';
import 'package:node_shims/js.dart';

/// Rating component that will take care of visualising a star rating bar
///
/// *Note*: Bootstrap 4 do not include glyphicons anymore, so if you want to continue use this font,
/// you will need to add a link to [`glyphicons.css`](https://github.com/valor-software/ng2-bootstrap/blob/master/demo/assets/css/glyphicons.css)
///
/// [demo](http://luisvt.github.io/ng2_strap/#accordion)
@Component (selector: "n2s-rating",
    templateUrl: 'rating.html')
class Rating extends DefaultValueAccessor implements OnInit {
  Rating(this.cd, Renderer renderer, ElementRef elementRef)
      : super (renderer, elementRef) {
    cd.valueAccessor = this;
  }

  ///
  NgModel cd;

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

  /// fired when icon selected, `$event:number` equals to selected rating
  @Output() EventEmitter onHover = new EventEmitter ();

  /// fired when icon selected, `$event:number` equals to previous rating value
  @Output() EventEmitter onLeave = new EventEmitter ();

  /// initialize attributes
  ngOnInit() {
    max ??= 5;
    readonly = readonly == true;
    stateOn ??= "glyphicon-star";
    stateOff ??= "glyphicon-star-empty";
    titles = titles != null && titles.length > 0  ? titles : ["one", "two", "three", "four", "five"];
    ratingStates ??= [];
    range = _buildTemplateObjects();
  }

  /// update model to view
  writeValue(num _value) {
    _value ??= 0;
    if (_value != 0) {
      value = _value.round();
      preValue = _value;
      return;
    }
    preValue = _value;
    value = _value;

  }

  /// build the template of the objects that will be rendered
  _buildTemplateObjects() {
    var count = or(ratingStates.length, max) ;
    var result = [];
    for (var i = 0; i < count; i++) {
      result.add({
        "index" : i,
        "stateOn" : stateOn,
        "stateOff" : stateOff,
        "title" : titles.length > i ? titles[i] : i + 1,
      }..addAll(ratingStates.length > i ? ratingStates[i] : {}));
    }
    return result;
  }

  /// change the value of the model
  rate(num value) {
    if (!readonly && value >= 0 && value <= range.length) {
      writeValue(value);
      cd.viewToModelUpdate(value);
    }
  }

  /// fired when a mouse enters to the icon, and it change the [value] of the rating
  enter(num _value) {
    if (!readonly) {
      value = _value;
      onHover.add(_value);
    }
  }

  /// fired when the mouse leave the icon, and it resets the [value] of the rating
  reset() {
    value = preValue;
    onLeave.add(value);
  }

  /// listen when the user does a key-down on the elements
  @HostListener('keydown', const ['\$event'])
  onKeydown(KeyboardEvent event) {
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
}