part of bs_dropdown;

/// Creates a component that will toggle the state of a dropdown-menu,
/// in other words when clicked will open or close the dropdown-menu
@Directive (selector: "bs-dropdown-toggle, .dropdown-toggle")
class BsDropdownToggleDirective {
  BsDropdownDirective dropdown;
  /// Reference to this HTML element
  HtmlElement elementRef;

  BsDropdownToggleDirective(this.elementRef);

  @HostBinding("attr.aria-haspopup")
  bool ariaHaspopup = true;

  /// if `true` this component is disabled
  @Input()
  @HostBinding('class.disabled')
  bool disabled = false;

  /// if `true` the attr.aria-expanded should be `true`
  @HostBinding('attr.aria-expanded')
  get isOpen => dropdown?.isOpen ?? false;

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