import 'dart:async';
import 'dart:html';

import "package:angular/angular.dart";
import 'package:ng_bootstrap/components/dropdown/index.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:ng_bootstrap/components/button/toggle.dart';
import 'package:angular_forms/angular_forms.dart';

// todo: options loading by http not yet implemented
/// Creates a type-ahead component
///
/// [demo](http://dart-league.github.io/ng_bootstrap/#typeahed)
@Component(
    selector: "bs-typeahead",
    templateUrl: 'typeahead.html',
    directives: const [
      bsDropdownDirectives,
      BsToggleButtonDirective,
      coreDirectives,
      formDirectives
    ])
class BsTypeAheadComponent extends DefaultValueAccessor {

  /// binds to string user's input
  NgModel ngModel;

  @ContentChild(TemplateRef)
  TemplateRef itemTemplate;

  /// local value to handle loading value
  bool loadingVal = false;

  final _loadingCtrl = new StreamController<bool>.broadcast();

  /// fires 'busy' state of this component was changed, fired on `async` mode only, returns
  /// `boolean`
  @Output() Stream get loading => _loadingCtrl.stream;

  /// local value to handle noResults value
  bool noResultsVal = false;

  final _noResultsCtrl = new StreamController<bool>.broadcast();

  /// fires `true` in case of matches are not detected when any user key event occurs
  @Output() Stream<bool> get noResults => _noResultsCtrl.stream;

  final _selectedItemChangeCtrl = new StreamController<dynamic>.broadcast();

  /// fired when option was selected, return object with data of this option
  @Output() Stream get selectedItemChange => _selectedItemChangeCtrl.stream;

  /// minimal no of characters that needs to be entered before typeahead kicks-in. Must be greater
  /// than or equal to 1.
  @Input() num minLength = 0;

  /// minimal wait time after last character typed before typeahead kicks-in
  @Input() num waitMs = 400;

  /// maximum length of options items list
  @Input() num optionsLimit = 200;

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
  @Input() bool focusOnSelect = true;

  /// If [source] items is an iterable of [Object] or [Map] we use this attribute to get the value of the field that matches [optionField]
  @Input() String optionField;

  /// provides the source of the dropdown list, it could be an [Iterable] or a [Function],
  /// if a function is passed, it means the list of elements could be loaded asynchronously.
  @Input() dynamic source;

  /// list of elements that match the typed input
  List matches = [];

  /// if `true` active option will be selected automatically
  @Input() bool autocomplete;

  /// if `true` the dropdown-menu will be open, and the date-picker visible
  bool isOpen = false;

  final _queryStreamCtrl = new StreamController<dynamic>.broadcast();

  Stream get _queryStream => _queryStreamCtrl.stream;

  var selectedItem;

  /// Construct a [BsTypeAheadComponent] component injecting [ngModel], [renderer], [elementRef]
  BsTypeAheadComponent(this.ngModel, HtmlElement elementRef)
      : super(elementRef) {
    ngModel.valueAccessor = this;

    _queryStream
        .transform(debounce(new Duration(milliseconds: waitMs)))
        .transform(switchMap((term) => source(term).asStream()))
        .forEach((matchesAux) {
          matches = matchesAux.take(optionsLimit).toList();
          _loadingCtrl.add(loadingVal = false);
          if (matches.isEmpty) _noResultsCtrl.add(noResultsVal = true);
        });
  }

  void processMatchesIfNotOpen() {
    if (!isOpen) processMatches();
  }

  /// process the elements that matches the entered query
  void processMatches([String value = '']) {
    isOpen = true;
    _noResultsCtrl.add(noResultsVal = false);
    if (value.length >= minLength) {
      // if source is function we should retrieve the results asynchronously
      if (source is Function) {
        _loadingCtrl.add(loadingVal = true);
        matches.clear();
        _queryStreamCtrl.add(value);
      } else if (source is Iterable) {
        var query = new RegExp(value, caseSensitive: false);
        matches = source.where((item) => query.hasMatch(_itemString(item))).take(optionsLimit).toList();
      }
    } else {
      matches.clear();
    }
  }

  /// fired when user do a keyboard event on the text-box
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

  /// selects the matched item
  selectMatch(value, [Event e = null]) {
    if (e != null) {
      e.stopPropagation();
      e.preventDefault();
    }

    ngModel.viewToModelUpdate(_itemString(value));
    isOpen = false;
    _selectedItemChangeCtrl.add(selectedItem = value);
    return false;
  }

  /// Returns the item as string
  _itemString(/*String | Map*/ item) =>
      item is String ? item :
      item is Map ? item[optionField] :
      throw new Exception('Type of item is not supported, please use a Map, SerializableMap or an String');

  /// highlights the matching part of the matched item. For example if user types "a" and the matched
  /// word is "Alaska" the result will be `<strong>A</strong>l<strong>a</strong>sk<strong>a</strong>`
  String highlight(item, String query) {
    String itemStr = _itemString(item);
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

  @HostListener('input', const ['\$event'])
  bool onInput($event) => true;
}
