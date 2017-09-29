part of bs_dropdown;

/// Creates a dropdown-menu component that will be showed
/// every time that a [BsDropdownDirective] is open
@Directive(selector: "bs-dropdown-menu, .dropdown-menu")
class BsDropdownMenuDirective implements OnInit {
  BsDropdownDirective dropdown;

  HtmlElement elementRef;

  BsDropdownMenuDirective(@Host() this.dropdown, this.elementRef);

  ngOnInit() {
    dropdown.dropDownMenu = this;
  }
}