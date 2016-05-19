import 'dart:html';

import "package:angular2/angular2.dart";
import 'package:ng2_strap/dropdown/index.dart';
import 'package:ng2_strap/index.dart';
import 'package:stream_transformers/stream_transformers.dart';

// todo: options loading by http not yet implemented
/// Creates a type-ahead component
///
/// [demo](http://luisvt.github.io/ng2_strap/#typeahed)
@Component(
    selector: "n2s-type-ahead",
    templateUrl: 'typeahead.html',
    directives: const [N2S_DROPDOWN_DIRECTIVES, N2sButtonCheckbox])
class N2sTypeAhead extends DefaultValueAccessor {

  /// Construct a N2sTypeAhead [N2sTypeAhead] component injecting [ngModel], [renderer], [elementRef]
  N2sTypeAhead(this.ngModel, Renderer renderer, ElementRef elementRef)
      : super(renderer, elementRef) {
    ngModel.valueAccessor = this;

    _queryStream
        .transform(new Debounce(new Duration(milliseconds: waitMs)))
        .distinct()
        .transform(new FlatMapLatest((term) => source(term).asStream()))
        .forEach((matchesAux) {
      matches = matchesAux.take(optionsLimit).toList();
      isOpen = !matches.isEmpty;
      loading.emit(false);
    });
  }

  /// binds to string user's input
  NgModel ngModel;

  /// fires 'busy' state of this component was changed, fired on `async` mode only, returns
  /// `boolean`
  @Output() EventEmitter loading = new EventEmitter();

  /// fires `true` in case of matches are not detected when any user key event occurs
  @Output() EventEmitter noResults = new EventEmitter();

  /// fired when option was selected, return object with data of this option
  @Output() EventEmitter selectedItemChange = new EventEmitter();

  /// minimal no of characters that needs to be entered before typeahead kicks-in. Must be greater
  /// than or equal to 1.
  @Input() num minLength = 1;

  /// minimal wait time after last character typed before typeahead kicks-in
  @Input() num waitMs = 300;

  /// maximum length of options items list
  @Input() num optionsLimit = 20;

  /// (*not implemented*) (`?boolean=true`) - if `false` restrict model values to the ones selected from the popup only will be provided
  // todo: not yet implemented
  @Input() bool editable;

  /// (*not implemented*) (`?boolean=true`) - if `false` the first match automatically will not be focused as you type
  // todo: not yet implemented
  @Input() bool focusFirst;

  /// (*not implemented*) (`?any`) - format the ngModel result after selection
  // todo: not yet implemented
  @Input() dynamic inputFormatter;

  /// (*not implemented*) (`?boolean=false`) - if `true` automatically select an item when there is one option that exactly matches the user input
  // todo: not yet implemented
  @Input() bool selectOnExact;

  /// (*not implemented*) (`?boolean=false`) - if `true` select the currently highlighted match on blur
  // todo: not yet implemented
  @Input() bool selectOnBlur;

  /// (*not implemented*) (`?boolean=true`) - if `false` don't focus the input element the typeahead directive is associated with on selection
  // todo: not yet implemented
  @Input() bool focusOnSelect;

  /// (`?string`) - name of field in array of states that contain options as objects, we use array
  /// item as option in case of this field is missing
  @Input() String optionField;

  /// provides the source of the dropdown list, it could be any [Iterable] list or an [Function],
  /// if a function is passed, it means the list of elements is going to be loaded asynchronously.
  @Input() dynamic source;

  /// list of elements that match the typed input
  List matches = [];

  /// if `true` active option will be selected automatically
  @Input() bool autocomplete;

  /// if `true` the dropdown-menu will be open, and the date-picker visible
  bool isOpen;

  final EventEmitter _queryStream = new EventEmitter();

  /// process the elements that matches the entered query
  void processMatches() {
    if (ngModel.model.length >= minLength) {
      // if source is function we should retrieve the results asynchronously
      if (source is Function) {
        loading.emit(true);
        matches.clear();
        _queryStream.add(ngModel.model);
      } else if (source is Iterable) {
        var query = new RegExp(ngModel.model);
        matches = source.where((item) =>
        /**/item is Map && item[optionField] != null && query.hasMatch(item[optionField]) ||
            item is String && query.hasMatch(item)
        ).take(optionsLimit).toList();
      }
    } else {
      matches.clear();
    }
    isOpen = !matches.isEmpty;
  }

  var selectedItem;

  /// fired when user do a keyboard event
  onTypeaheadChange(KeyboardEvent e) {
    if (!isOpen) {
      if ((e.keyCode == KeyCode.DOWN || e.keyCode == KeyCode.UP) && !matches.isEmpty)
        isOpen = true;
      else {
        return;
      }
    }

    switch (e.keyCode) {
      case KeyCode.ESC:
        isOpen = false;
        return;
      case KeyCode.UP:
        _prevActiveMatch();
        return;
      case KeyCode.DOWN:
        _nextActiveMatch();
        return;
      case KeyCode.ENTER:
        _selectActiveMatch();
        return;
      case KeyCode.TAB:
        if (autocomplete == true) {
          _selectActiveMatch();
        } else {
          isOpen = false;
        }
        return;
    }
  }

  /// fired when model changes
  changeModel(String value) {
    ngModel.viewToModelUpdate(value);
    isOpen = false;
  }

  /// selects the matched item
  selectMatch(value, [Event e = null]) {
    if (e != null) {
      e.stopPropagation();
      e.preventDefault();
    }
    changeModel(_itemString(value, optionField));
    selectedItem = value;
    selectedItemChange.emit(value);
    return false;
  }

  /// Returns the item as string
  _itemString(item, String optionField) =>
      item is String ? item : item[optionField];

  /// highlights the matching part of the matched item. For example if user types "a" and the matched
  /// word is "Alaska" the result will be `<strong>A</strong>l<strong>a</strong>sk<strong>a</strong>`
  String highlight(item, String query) {
    String itemStr = _itemString(item, optionField);
    // Replaces the capture string with a the same string inside of a "strong" tag
    return query != null && !query.isEmpty
        ? itemStr.replaceAllMapped(_escapeRegexp(query), (m) => "<strong>${m[0]}</strong>")
        : itemStr;
  }

  /// captures the whole query string and replace it with the string that will be used to match
  /// the results, for example if the capture is "a" the result will be \a
  RegExp _escapeRegexp(String queryToEscape) =>
      new RegExp(queryToEscape.replaceAll(new RegExp(r'([.?*+^$[\]\\(){}|-])'), r"\$1"), caseSensitive: false);

  /// makes the next item active/highlighted
  void _prevActiveMatch() {
    var index = matches.indexOf(selectedItem);
    selectedItem = matches[index - 1 < 0 ? matches.length - 1 : index - 1];
  }

  /// makes the next item active/highlighted
  void _nextActiveMatch() {
    var index = matches.indexOf(selectedItem);
    selectedItem = matches[index + 1 > matches.length - 1 ? 0 : index + 1];
  }

  /// makes the active/highlited item the matched item
  void _selectActiveMatch() {
    selectMatch(selectedItem);
  }
}

/// (*not implemented*) This component is used to pass an html template to the dropdown-menu-item
@Directive(selector: 'template[n2s-renderer]')
class N2sRenderer {

  /// constructs a [N2sRenderer] passing the [templateRef]
  N2sRenderer(this.templateRef);

  /// current DOM element reference.
  TemplateRef templateRef;

}
