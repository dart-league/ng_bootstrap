part of n2s_dropdown;

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