import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:ng_bootstrap/components/timepicker/timepicker.dart';

@Component(selector: 'timepicker-demo',
    templateUrl: 'timepicker_demo.html',
    directives: [BsTimePickerComponent, coreDirectives, formDirectives])
class TimepickerDemo {
  String hstep = '1';
  int get hstepInt => int.parse(hstep);
  String mstep = '15';
  int get mstepInt => int.parse(mstep);
  bool ismeridian = true;
  String mytime = DateTime.now().toString();
  dynamic options = {
    'hstep': [1, 2, 3],
    'mstep': [1, 5, 10, 15, 25, 30]
  };
  void toggleMode() {
    ismeridian = !ismeridian;
  }

  void update() {
    var d = DateTime(0, 1, 1, 14);
    mytime = d.toString();
  }

  void changed() {
    print('Time changed to: ${mytime}');
  }

  void clear() {
    mytime = null;
  }
}
