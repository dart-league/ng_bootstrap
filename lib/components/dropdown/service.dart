part of bs_dropdown;

const ALWAYS = "always";

const DISABLED = "disabled";

const OUTSIDECLICK = "outsideClick";

class DropdownService {
  BsDropdownDirective openScope;

  BsDropdownDirective dropdownScope;

  StreamSubscription closeDropdownStSub;

  StreamSubscription keybindFilterStSub;

  open(BsDropdownDirective dropdownScope) {
    if (openScope == null) {
      closeDropdownStSub = window.onClick.listen(closeDropdown);
      keybindFilterStSub = window.onKeyDown.listen(keybindFilter);
    }
    if (openScope != null && openScope != dropdownScope) {
      openScope.isOpen = false;
    }
    openScope = dropdownScope;
  }

  close(BsDropdownDirective dropdownScope) {
    if (openScope != dropdownScope) {
      return;
    }
    openScope = null;
    closeDropdownStSub.cancel();
    keybindFilterStSub.cancel();
  }

  closeDropdown(MouseEvent event) {
    if (openScope == null) {
      return;
    }
    if (event != null && identical(openScope.autoClose, DISABLED)) {
      return;
    }
    if (event != null
        && openScope.toggleEl != null
        && openScope.toggleEl == event.target) {
      return;
    }
    if (event != null && openScope.autoClose == OUTSIDECLICK &&
        openScope.menuEl != null &&
        openScope.menuEl == event.target) {
      return;
    }
    openScope.isOpen = false;
  }

  keybindFilter(KeyboardEvent event) {
    if (event.which == KeyCode.ESC) {
      openScope.focusToggleElement();
      closeDropdown(null);
      return;
    }
    if (openScope.keyboardNav && openScope.isOpen &&
        (event.which == KeyCode.UP || event.which == KeyCode.DOWN)) {
      event.preventDefault();
      event.stopPropagation();
      openScope.focusDropdownEntry(event.which);
    }
  }
}

DropdownService dropdownService = new DropdownService();