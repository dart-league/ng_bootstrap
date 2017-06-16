import 'package:angular2/angular2.dart';

@Component(selector: 'bs-input',
  template: '<input class="form-control" type="text" [name]="name" [(ngModel)]="ngModel.model"/>'
)
class BsInput extends DefaultValueAccessor {
  BsInput(ElementRef elementRef) : super(elementRef);

}
