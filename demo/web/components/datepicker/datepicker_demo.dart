import "package:angular/angular.dart";
import 'package:angular_forms/angular_forms.dart';
import 'package:ng_bootstrap/ng_bootstrap.dart';

@Component(selector: "datepicker-demo",
    templateUrl: 'datepicker_demo.html',
    directives: const [BsDatePickerComponent, BsDatePickerPopupComponent, coreDirectives, formDirectives])
class DatepickerDemo {
  DateTime dt = new DateTime.now();
  DateTime dt2 = new DateTime.now();
  List<Map> events;
  DateTime tomorrow;
  DateTime afterTomorrow;
  List<String> formats = [
    "dd-MM-yyyy",
    "yyyy/MM/dd",
    "dd.MM.yy",
    "yMd"
  ];
  String format;
  Map<String,dynamic> dateOptions = {"formatYear": "YY", "startingDay": 1};
  bool opened = false;

  DateTime minDate = new DateTime.now().add(new Duration(days: -1000));

  DatepickerDemo() {
    tomorrow = new DateTime.now().add(new Duration(days: 1));
    afterTomorrow = new DateTime.now().add(new Duration(days: 2));
    minDate = new DateTime.now().add(new Duration(days: -1000));
    events = [
      {"date": tomorrow, "status": "full"},
      {"date": afterTomorrow, "status": "partially"}
    ];
    format = formats[0];
  }
  today() {
    dt = new DateTime.now();
  }

  d20090824() {
    dt = new DateTime(2009, 08, 24);
  }

  // todo: implement custom class cases
  getDayClass(DateTime date, String mode) {
    if (mode == "day") {
      DateTime dayToCheck = new DateTime(date.year, date.month, date.day);
      for (var event in events) {
        var currentDay = event['date'];
        if (dayToCheck == currentDay) {
          return event['status'];
        }
      }
    }
    return "";
  }

  bool disabled(DateTime date, String mode) {
    return mode == "day" && (date.day == 0 || date.day == 6);
  }

  clear() {
    dt = null;
  }

  toggleMin() {
    dt = minDate;
  }
}
