import "package:angular2/angular2.dart";
import 'package:ng_bootstrap/components/input/input.dart';

@Component(selector: "input-demo",
    templateUrl: "input_demo.html",
    directives: const [BsInput])
class InputDemo {
  Person person = new Person()
      ..firstName = 'Jhon asdf'
      ..lastName = 'Doe asdf';
}

class Person {
  String firstName;
  String lastName;
}
