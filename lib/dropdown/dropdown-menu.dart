part of n2s_dropdown;

/// Creates a dropdown-menu component that will be showed every time that a [N2sDropdown] is open
@Directive (selector: "n2s-dropdown-menu, .dropdown-menu")
class N2sDropdownMenu implements OnInit {
  N2sDropdown dropdown;

  ElementRef elementRef;

  N2sDropdownMenu(@Host() this.dropdown, this.elementRef);

  ngOnInit() {
    dropdown.dropDownMenu = this;
  }
}