part of n2s_dropdown;

/// Creates a component that will toggle the state of a dropdown-menu, in other words when clicked will
/// open or close the dropdown-menu
@Directive (selector: "n2s-dropdown-toggle, [n2s-dropdown-toggle], .dropdown-toggle",
    host: const {
      "[class.dropdown-toggle]" : "true",
      "[class.disabled]" : "disabled",
      "[attr.aria-haspopup]" : "true",
      "[attr.aria-expanded]" : "isOpen"
    })
class N2sDropdownToggle implements OnInit {
  /// Constructs a [N2sDropdownToggle] injecting the container [dropdown] and the current [elementRef]
  N2sDropdownToggle(@Host() this.dropdown, this.elementRef);

  /// Container dropdown
  N2sDropdown dropdown;

  /// Reference to this HTML element
  ElementRef elementRef;

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