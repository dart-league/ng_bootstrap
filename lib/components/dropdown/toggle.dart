part of n2s_dropdown;

/// Creates a component that will toggle the state of a dropdown-menu,
/// in other words when clicked will open or close the dropdown-menu
@Directive (selector: "bs-dropdown-toggle, [bs-dropdown-toggle], .dropdown-toggle",
    host: const {
      "[class.dropdown-toggle]" : "true",
      "[class.disabled]" : "disabled",
      "[attr.aria-haspopup]" : "true",
      "[attr.aria-expanded]" : "isOpen"
    })
class DropdownToggle implements OnInit {
  Dropdown dropdown;
  /// Reference to this HTML element
  ElementRef elementRef;

  DropdownToggle(@Host() this.dropdown, this.elementRef);

  /// if `true` this component is disabled
  @Input() bool disabled = false;


  ngOnInit() {
    dropdown.dropDownToggle = this;
  }

  /// if `true` the attr.aria-expanded should be `true`
  get isOpen => dropdown.isOpen;

  /// toggles the state of the dropdown
  @HostListener('click', const ['\$event'])
  toggleDropdown(MouseEvent event) {
    event.preventDefault();
    event.stopPropagation();
    if (!disabled) {
      dropdown.toggle();
    }
  }
}