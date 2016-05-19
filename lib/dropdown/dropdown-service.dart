part of n2s_dropdown;

const _ALWAYS = "always";

const _DISABLED = "disabled";

const _OUTSIDECLICK = "outsideClick";

class DropdownService {
  N2sDropdown openScope;

  N2sDropdown dropdownScope;

  StreamSubscription closeDropdownStSub;

  StreamSubscription keybindFilterStSub;

  open(N2sDropdown dropdownScope) {
    if (openScope == null) {
      closeDropdownStSub = window.onClick.listen(closeDropdown);
      keybindFilterStSub = window.onKeyDown.listen(keybindFilter);
    }
    if (openScope != null && openScope != dropdownScope) {
      openScope.isOpen = false;
    }
    openScope = dropdownScope;
  }

  close(N2sDropdown dropdownScope) {
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
    if (event != null && identical(openScope.autoClose, _DISABLED)) {
      return;
    }
    if (event != null
        && openScope.toggleEl != null
        && openScope.toggleEl.nativeElement == event.target) {
      return;
    }
    if (event != null && openScope.autoClose == _OUTSIDECLICK &&
        openScope.menuEl != null &&
        openScope.menuEl.nativeElement == event.target) {
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