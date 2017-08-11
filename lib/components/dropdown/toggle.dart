part of bs_dropdown;

/// Creates a component that will toggle the state of a dropdown-menu,
/// in other words when clicked will open or close the dropdown-menu
@Directive (selector: "bs-dropdown-toggle, .dropdown-toggle",
    host: const {
      "[class.disabled]" : "disabled",
      "[attr.aria-haspopup]" : "true",
      "[attr.aria-expanded]" : "isOpen"
    })
class BsDropdownToggleDirective implements OnInit {
  BsDropdownDirective dropdown;
  /// Reference to this HTML element
  HtmlElement elementRef;

  BsDropdownToggleDirective(@Host() this.dropdown, this.elementRef);

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