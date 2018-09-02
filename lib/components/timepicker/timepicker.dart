import "package:angular/angular.dart";
import 'dart:html';
import 'package:angular_forms/angular_forms.dart';

// todo: implement global configuration via DI

// todo: refactor directive has to many functions! (extract to stateless helper)

// todo: implement `time` validator

// todo: replace increment/decrement blockers with getters, or extract
/// add [minutes] to [time]
DateTime addMinutes(DateTime time, int minutes) => time.add(new Duration(minutes: minutes));

/// A lightweight & configurable timepicker directive
///
/// [demo](http://dart-league.github.io/ng_bootstrap/#timepicker)
@Component (selector: "bs-time-picker",
    templateUrl: 'timepicker.html',
    directives: const [coreDirectives, formDirectives])
class BsTimePickerComponent extends DefaultValueAccessor implements OnInit {
  ///
  BsTimePickerComponent(this.cd, HtmlElement elementRef)
      : super (elementRef) {
    cd.valueAccessor = this;
  }

  /// result value
  DateTime _selected = new DateTime.now();

  /// hours change step
  @Input() num hourStep = 1;

  /// minutes change step
  @Input() num minuteStep = 1;

  /// ['AM', 'PM'] - meridian labels based on locale (*will be based later*)
  dynamic meridian;

  /// works in 12H mode and displays AM/PM. If `false` works in 24H mode and hides AM/PM
  @Input() List<String> meridians = ["AM", "PM"];

  /// if `true` hours and minutes fields will be readonly
  @Input() bool readonlyInput = false;

  /// if `true` scroll inside hours and minutes inputs will change time
  @Input() bool mousewheel = true;

  /// if `true` up/down arrowkeys inside hours and minutes inputs will change time
  @Input() bool arrowkeys = true;

  /// if `true` spinner arrows above and below the inputs will be shown
  @Input() bool showSpinners = true;

  /// minimum time user can select
  @Input() DateTime min;

  /// maximum time user can select
  @Input() DateTime max;

  /// value of hours shown in the input
  String hours;

  /// value of minutes shown in the input
  String minutes;

  /// selected DateTime to handle time
  DateTime get selected {
    return _selected;
  }

  /// selected DateTime to handle time
  set selected(DateTime v) {
    if (v != null) {
      this._selected = v;
      this.updateTemplate();
      this.cd.viewToModelUpdate(this.selected.toIso8601String());
    }
  }

  /// check if hours value is invalid
  bool invalidHours = false;

  /// check if minutes value is invalid
  bool invalidMinutes = false;

  bool _showMeridian = true;

  /// if `true` works in 12H mode and displays AM/PM. If `false` works in 24H mode and hides AM/PM
  bool get showMeridian {
    return this._showMeridian;
  }

  /// sets the value of showing meridian, if `true` works in 12H mode and displays AM/PM. If `false` works in 24H mode and hides AM/PM
  @Input() void set showMeridian(bool value) {
    _showMeridian = value;
    // || !this.$error.DateTime
    if (true) {
      updateTemplate();
      return;
    }
  }

  /// binds to Date object
  NgModel cd;

  // todo: add formatter value to DateTime object
  ngOnInit() {
    // todo: take in account $locale.DATETIME_FORMATS.AMPMS;
    if (mousewheel) {
      setupMousewheelEvents();
    }
    if (arrowkeys) {
      setupArrowkeyEvents();
    }
    setupInputEvents();
  }

  /// writes value to selected datetime whenever the inputs change
  writeValue(v) async {
    selected = DateTime.parse(v ?? '1971-01-01T00:00:00');
  }

  /// refresh the template
  refresh([ String type ]) {
    // this.makeValid();
    updateTemplate();
    cd.viewToModelUpdate(selected.toIso8601String());
  }

  /// updates the template
  updateTemplate([dynamic keyboardChange]) {
    var _hours = selected.hour;
    var _minutes = selected.minute;
    if (showMeridian) {
      // Convert 24 to 12 hour system
      _hours = (_hours ==  0 || _hours ==  12) ? 12 : _hours % 12;
    }
    // this.hours = keyboardChange === 'h' ? hours : this.pad(hours);

    // if (keyboardChange !== 'm') {

    //  this.minutes = this.pad(minutes);

    // }
    hours = pad(_hours);
    minutes = pad(_minutes);
    meridian = selected.hour < 12 ? meridians[0] : meridians[1];
  }

  /// get the value of hours from template
  getHoursFromTemplate() {
    var hours = int.tryParse(this.hours) ?? 0;
    var valid = showMeridian ? (hours > 0 && hours < 13) : (hours >= 0 &&
        hours < 24);
    if (!valid) {
      return null;
    }
    if (showMeridian) {
      if (hours == 12) {
        hours = 0;
      }
      if (meridian ==  meridians [ 1 ]) {
        hours = hours + 12;
      }
    }
    return hours;
  }

  /// parse the minutes string from the template
  getMinutesFromTemplate() {
    var _minutes = int.tryParse(minutes) ?? 0;
    return (_minutes >= 0 && _minutes < 60) ? _minutes : null;
  }

  /// add zeroes at the left if [value] has one digit
  pad(value) =>
      (value != null && value.toString().length < 2)
        ? "0" + value.toString()
        : value.toString();

  ///
  setupMousewheelEvents() {}

  ///
  setupArrowkeyEvents() {}

  ///
  setupInputEvents() {}

  /// updates the value of hour
  updateHours() {
    if (readonlyInput) {
      return;
    }
    var hours = getHoursFromTemplate();
    var minutes = getMinutesFromTemplate();
    if (hours == null || minutes == null) {}
    selected = _updateDateTime(selected, hours: hours);
    if (min != null && !(selected.isBefore(min) || max != null && selected.isAfter(max))) {
      refresh("h");
    }
  }

  /// fired when the hours input blur
  hoursOnBlur(Event event) {
    if (readonlyInput) {
      return;
    }
    // todo: binded with validation
    if (!invalidHours && int.parse(hours) < 10) {
      hours = pad(hours);
    }
  }

  /// update the minutes value
  updateMinutes() {
    if (readonlyInput) {
      return;
    }
    var minutes = getMinutesFromTemplate();
    var hours = getHoursFromTemplate();
    if (minutes == null || hours == null) {}
    selected = _updateDateTime(selected, minutes: minutes);
//    selected.minute = minutes;
    if (!(min != null && selected.isBefore(min) || max != null && selected.isAfter(max))) {
      refresh("m");
    }
  }

  /// update the whole datetime value
  _updateDateTime(DateTime selected, {int minutes, int hours}) =>
      new DateTime(
          selected.year,
          selected.month,
          selected.day,
          hours ?? selected.hour,
          minutes ?? selected.minute,
          selected.second);

  /// fired when minutes input blur
  minutesOnBlur(Event event) {
    if (readonlyInput) {
      return;
    }
    if (!invalidMinutes && int.parse(minutes) < 10) {
      minutes = pad(minutes);
    }
  }

  /// check if hours should be incremented
  bool noIncrementHours() {
    var incrementedSelected = addMinutes(selected, hourStep * 60);
    return min != null && incrementedSelected.isBefore(min)
        || max != null && incrementedSelected.isAfter(selected) && incrementedSelected.isAfter(max);
  }

  /// check if hours should be decremented
  bool noDecrementHours() {
    var decrementedSelected = addMinutes(selected, -hourStep * 60);
    return min != null && decrementedSelected.isBefore(min)
        || max != null && decrementedSelected.isAfter(selected) && decrementedSelected.isAfter(max);
  }

  /// check if minutes should be incremented
  bool noIncrementMinutes() {
    var incrementedSelected = addMinutes(selected, minuteStep);
    return min != null && incrementedSelected.isBefore(min)
        || max != null && incrementedSelected.isAfter(selected) && incrementedSelected.isAfter(max);
  }

  /// check if minutes should be decremented
  bool noDecrementMinutes() {
    var decrementedSelected = addMinutes(selected, -minuteStep);
    return min != null && decrementedSelected.isBefore(min)
        || max != null && decrementedSelected.isAfter(selected) && decrementedSelected.isAfter(max);
  }

  /// add [minutes] to [selected]
  void addMinutesToSelected(minutes) {
    selected = addMinutes(selected, minutes);
    refresh();
  }

  /// check if meridian should be showed
  bool noToggleMeridian() {
    if (selected.hour < 13) {
      return max != null && addMinutes(selected, 12 * 60).isAfter(max);
    } else {
      return min != null && addMinutes(selected, -12 * 60).isBefore(min);
    }
  }

  /// increment hours using [hourStep]
  incrementHours() {
    if (!noIncrementHours()) {
      addMinutesToSelected(hourStep * 60);
    }
  }

  /// decrement hours using [hourStep]
  decrementHours() {
    if (!noDecrementHours()) {
      addMinutesToSelected(-hourStep * 60);
    }
  }

  /// increment minutes using [minuteStep]
  incrementMinutes() {
    if (!noIncrementMinutes()) {
      addMinutesToSelected(minuteStep);
    }
  }

  /// decrement minutes using [minuteStep]
  decrementMinutes() {
    if (!noDecrementMinutes()) {
      addMinutesToSelected(-minuteStep);
    }
  }

  /// toggle the status of meridian
  toggleMeridian() {
    if (!noToggleMeridian()) {
      var sign = selected.hour < 12 ? 1 : -1;
      addMinutesToSelected(12 * 60 * sign);
    }
  }

  @HostListener('input', const ['\$event'])
  bool onInput(Event $event) => true;
}