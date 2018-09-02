part of bs_dropdown;

/// Creates a dropdown-menu component that will be showed
/// every time that a [BsDropdownDirective] is open
@Directive(selector: "bs-dropdown-menu, .dropdown-menu")
class BsDropdownMenuDirective {
  HtmlElement elementRef;

  BsDropdownMenuDirective(this.elementRef);
}