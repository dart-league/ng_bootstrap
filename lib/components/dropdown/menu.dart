import 'package:angular2/angular2.dart';
import 'dropdown.dart';

/// Creates a dropdown-menu component that will be showed
/// every time that a [Dropdown] is open
@Directive (selector: "bs-dropdown-menu, .dropdown-menu")
class DropdownMenu implements OnInit {
  Dropdown dropdown;

  ElementRef elementRef;

  DropdownMenu(@Host() this.dropdown, this.elementRef);

  ngOnInit() {
    dropdown.dropDownMenu = this;
  }
}