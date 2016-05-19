part of n2s_dropdown;
/// Dropdowns are toggleable, contextual overlays for displaying lists of links and more.
/// They’re made interactive with the included dropdown directives.
///
/// Base specifications: [bootstrap 3](http://getbootstrap.com/javascript/#dropdowns) or
/// [bootstrap 4](http://v4-alpha.getbootstrap.com/components/dropdowns/)
///
/// [demo](http://luisvt.github.io/ng2_strap/#dropdown)
@Directive (selector: "n2s-dropdown, .dropdown",
    host: const {"[class.dropdown]" : "true", "[class.open]" : "isOpen"})
class N2sDropdown implements OnInit, OnDestroy {

  /// Constructs a dropdown injecting [elementRef]
  N2sDropdown(this.elementRef);

  /// injected [elementRef] to get access to native attributes
  ElementRef elementRef;

  /// if `true` `dropdown-menu` content will be appended to the body. This is useful when
  /// the dropdown button is inside a div with `overflow: hidden`, and the menu would
  /// otherwise be hidden
  @Input() bool dropdownAppendToBody = false;

  /// behaviour vary:
  ///  * `always` - (default) automatically closes the dropdown when any of its elements is clicked
  ///  * `outsideClick` - closes the dropdown automatically only when the user clicks any element
  ///  outside the dropdown
  ///  * `disabled` - disables the auto close. You can then control the open/close status of the
  ///  dropdown manually, by using `is-open`. Please notice that the dropdown will still close
  ///  if the toggle is clicked, the `esc` key is pressed or another dropdown is open
  @Input() String autoClose = _ALWAYS;

  /// if `true` will enable navigation of dropdown list elements with the arrow keys
  @Input() bool keyboardNav = false;

  /// index of selected element
  num selectedOption;

  /// drop menu html
  ElementRef menuEl;

  /// drop down toggle element
  ElementRef toggleEl;

  /// if `true` dropdown will be opened
  bool _isOpen = false;

  /// if `true` dropdown will be opened
  bool get isOpen {
    return _isOpen;
  }

  /// if `true` the dropdown will be visible
  @Input() set isOpen(value) {
    _isOpen = value ?? false;
    // todo: implement after porting position
    if (truthy(dropdownAppendToBody) && truthy(menuEl)) {}
    // todo: $animate open<->close transitions, as soon as ng2Animate will be ready
    if (isOpen) {
      focusToggleElement();
      dropdownService.open(this);
    } else {
      dropdownService.close(this);
      selectedOption = null;
    }
    isOpenChange.add(isOpen);
    // todo: implement call to setIsOpen if set and function
  }

  /// fired when `dropdown` toggles, `$event:boolean` equals dropdown `[isOpen]` state
  @Output() EventEmitter isOpenChange = new EventEmitter();

  /// sets the element that will fire the toggle of the dropdown
  set dropDownToggle(N2sDropdownToggle dropdownToggle) {
    // init toggle element
    toggleEl = dropdownToggle.elementRef;
  }

  /// initializes the dropdown attributes
  ngOnInit() {
//    autoClose ?? ALWAYS;
//    keyboardNav ?? true;
//    dropdownAppendToBody ?? true;
//    if (isOpen) {}
  }

  /// removes the dropdown from the DOM
  ngOnDestroy() {
    if (dropdownAppendToBody && truthy(menuEl)) {
      menuEl.nativeElement.remove();
    }
  }

  /// sets the element that will be showed by the dropdown
  set dropDownMenu(N2sDropdownMenu dropdownMenu) {
    // init drop down menu
    menuEl = dropdownMenu.elementRef;
    if (dropdownAppendToBody) {
      window.document.documentElement.children.add(menuEl.nativeElement);
    }
  }

  /// toggles the visibility of the dropdown-menu
  bool toggle([ bool open ]) {
    return isOpen = open ?? !isOpen;
  }

  /// focus the specified entry of dropdown in dependence of the [keyCode]
  focusDropdownEntry(num keyCode) {
    // If append to body is used.
    Element hostEl = menuEl?.nativeElement ?? elementRef.nativeElement.querySelectorAll("ul")[0];
    if (hostEl == null) {
      // todo: throw exception?
      return;
    }
    var elems = hostEl.querySelectorAll("a");
    if (elems == null || elems.isEmpty) {
      // todo: throw exception?
      return;
    }
    switch (keyCode) {
      case (KeyCode.DOWN) :
        if (selectedOption is! num) {
          selectedOption = 0;
          break;
        }
        if (identical(selectedOption, elems.length - 1)) {
          break;
        }
        selectedOption++;
        break;
      case (KeyCode.UP) :
        if (selectedOption is! num) {
          return;
        }
        if (identical(selectedOption, 0)) {
          // todo: return?
          break;
        }
        selectedOption--;
        break;
    }
    elems[selectedOption].focus();
  }

  /// focus toggle element
  focusToggleElement() {
    if (toggleEl != null) {
      toggleEl.nativeElement.focus();
    }
  }
}