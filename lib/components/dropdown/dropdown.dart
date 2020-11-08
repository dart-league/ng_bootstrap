part of bs_dropdown;

class AutoClose {
  static const ALWAYS = 'always',
               DISABLED = 'disabled',
               OUTSIDE_CLICK = 'outsideClick';
}

@Directive(selector: 'bs-dropdown, .dropdown')
class BsDropdownDirective implements OnInit, OnDestroy, AfterContentInit {
  HtmlElement elementRef;

  BsDropdownDirective(this.elementRef);

  /// if `true` `dropdown-menu` content will be appended to the body. This is useful when
  /// the dropdown button is inside a div with `overflow: hidden`, and the menu would
  /// otherwise be hidden
  @Input()
  bool dropdownAppendToBody = false;

  /// behaviour vary:
  ///  * `always` - (default) automatically closes the dropdown when any of its elements is clicked
  ///  * `outsideClick` - closes the dropdown automatically only when the user clicks any element
  ///  outside the dropdown
  ///  * `disabled` - disables the auto close. You can then control the open/close status of the
  ///  dropdown manually, by using `is-open`. Please notice that the dropdown will still close
  ///  if the toggle is clicked, the `esc` key is pressed or another dropdown is open
  @Input()
  String autoClose = AutoClose.ALWAYS;

  /// if `true` will enable navigation of dropdown list elements with the arrow keys
  @Input()
  bool keyboardNav = false;

  /// index of selected element
  num selectedOption;

  /// drop menu html
  HtmlElement menuEl;

  /// if `true` dropdown will be opened
  bool _isOpen = false;

  /// if `true` dropdown will be opened
  @HostBinding('class.show')
  bool get isOpen => _isOpen;

  StreamSubscription _closeDropdownStSub;

  StreamSubscription _keyBindFilterStSub;

  /// if `true` the dropdown will be visible
  @Input()
  set isOpen(value) {
    _isOpen = value ?? false;
    // todo: implement after porting position
    if (truthy(dropdownAppendToBody) && truthy(menuEl)) {}
    // todo: $animate open<->close transitions, as soon as ng2Animate will be ready
    if (isOpen) {
      _focusToggleElement();

      _closeDropdownStSub = window.onClick.listen((_) => isOpen = false);
      _keyBindFilterStSub = window.onKeyDown.listen(_keyBindFilter);
//      dropdownService.open(this);
    } else {
//      dropdownService.close(this);
      selectedOption = null;
      _closeDropdownStSub?.cancel();
      _keyBindFilterStSub?.cancel();
    }
    _isOpenChangeCtrl.add(_isOpen);
    // todo: implement call to setIsOpen if set and function
  }

  final _isOpenChangeCtrl = StreamController<bool>.broadcast();

  /// fired when `dropdown` toggles, `$event:boolean` equals dropdown `[isOpen]` state
  @Output()
  Stream<bool> get isOpenChange => _isOpenChangeCtrl.stream;

  @ContentChild(BsDropdownToggleDirective)
  BsDropdownToggleDirective dropdownToggle;

  /// initializes the dropdown attributes
  @override
  void ngOnInit() {
//    autoClose ?? ALWAYS;
//    keyboardNav ?? true;
//    dropdownAppendToBody ?? true;
//    if (isOpen) {}
  }

  @override
  void ngAfterContentInit() {
    dropdownToggle.dropdown = this;
  }

  /// removes the dropdown from the DOM
  @override
  void ngOnDestroy() {
    if (dropdownAppendToBody && truthy(menuEl)) {
      menuEl.remove();
    }
  }

  /// sets the element that will be showed by the dropdown
  set dropDownMenu(BsDropdownMenuDirective dropdownMenu) {
    // init drop down menu
    menuEl = dropdownMenu.elementRef;
    if (dropdownAppendToBody) {
      window.document.documentElement.children.add(menuEl);
    }
  }

  /// toggles the visibility of the dropdown-menu
  bool toggle([bool open]) {
    return isOpen = open ?? !isOpen;
  }

  /// focus the specified entry of dropdown in dependence of the [keyCode]
  void focusDropdownEntry(num keyCode) {
    // If append to body is used.
    var hostEl = menuEl ?? elementRef.querySelectorAll('ul')[0];
    if (hostEl == null) {
      // todo: throw exception?
      return;
    }
    var elements = hostEl.querySelectorAll('a');
    if (elements == null || elements.isEmpty) {
      // todo: throw exception?
      return;
    }
    switch (keyCode) {
      case (KeyCode.DOWN):
        if (selectedOption is! num) {
          selectedOption = 0;
          break;
        }
        if (identical(selectedOption, elements.length - 1)) {
          break;
        }
        selectedOption++;
        break;
      case (KeyCode.UP):
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
    elements[selectedOption].focus();
  }

  /// focus toggle element
  void _focusToggleElement() =>
      dropdownToggle.elementRef.focus();

  void _keyBindFilter(KeyboardEvent event) {
    if (event.which == KeyCode.ESC) {
      _focusToggleElement();
      isOpen = false;
      return;
    }
    if (keyboardNav && isOpen && (event.which == KeyCode.UP || event.which == KeyCode.DOWN)) {
      event.preventDefault();
      event.stopPropagation();
      focusDropdownEntry(event.which);
    }
  }
}
