part of n2s_dropdown;

/// Creates a dropdown-menu component that will be showed every time that a [NgBsDropdown] is open
@Directive (selector: "ngbs-dropdown-menu, .dropdown-menu")
class NgBsDropdownMenu implements OnInit {
  NgBsDropdown dropdown;

  ElementRef elementRef;

  NgBsDropdownMenu(@Host() this.dropdown, this.elementRef);

  ngOnInit() {
    dropdown.dropDownMenu = this;
  }
}