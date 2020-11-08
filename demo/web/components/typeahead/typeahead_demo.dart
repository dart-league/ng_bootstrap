library typeahead.typeahead_demo;

import 'dart:async';

import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:dson/dson.dart';
import 'package:ng_bootstrap/ng_bootstrap.dart';

part 'typeahead_demo.g.dart';

@Component (selector: 'typeahead-demo',
    templateUrl: 'typeahead_demo.html',
    directives: [BsTypeAheadComponent, coreDirectives, formDirectives/*, BsRenderer*/])
class TypeaheadDemo {
  String selected = '';

  String selectedObj = '';

  var selectedItem;

  State selectedItemObj;

  String selectedAsync = '';

  var selectedItemAsync;

  bool typeaheadLoading = false;

  bool typeaheadNoResults = false;

  List<String> states = [
    'Alabama',
    'Alaska',
    'Arizona',
    'Arkansas',
    'California',
    'Colorado',
    'Connecticut',
    'Delaware',
    'Florida',
    'Georgia',
    'Hawaii',
    'Idaho',
    'Illinois',
    'Indiana',
    'Iowa',
    'Kansas',
    'Kentucky',
    'Louisiana',
    'Maine',
    'Maryland',
    'Massachusetts',
    'Michigan',
    'Minnesota',
    'Mississippi',
    'Missouri',
    'Montana',
    'Nebraska',
    'Nevada',
    'New Hampshire',
    'New Jersey',
    'New Mexico',
    'New York',
    'North Dakota',
    'North Carolina',
    'Ohio',
    'Oklahoma',
    'Oregon',
    'Pennsylvania',
    'Rhode Island',
    'South Carolina',
    'South Dakota',
    'Tennessee',
    'Texas',
    'Utah',
    'Vermont',
    'Virginia',
    'Washington',
    'West Virginia',
    'Wisconsin',
    'Wyoming'
  ];

  List<dynamic> statesComplex = [
    { 'id' : 1, 'name' : 'Alabama'},
    { 'id' : 2, 'name' : 'Alaska'},
    { 'id' : 3, 'name' : 'Arizona'},
    { 'id' : 4, 'name' : 'Arkansas'},
    { 'id' : 5, 'name' : 'California'},
    { 'id' : 6, 'name' : 'Colorado'},
    { 'id' : 7, 'name' : 'Connecticut'},
    { 'id' : 8, 'name' : 'Delaware'},
    { 'id' : 9, 'name' : 'Florida'},
    { 'id' : 10, 'name' : 'Georgia'},
    { 'id' : 11, 'name' : 'Hawaii'},
    { 'id' : 12, 'name' : 'Idaho'},
    { 'id' : 13, 'name' : 'Illinois'},
    { 'id' : 14, 'name' : 'Indiana'},
    { 'id' : 15, 'name' : 'Iowa'},
    { 'id' : 16, 'name' : 'Kansas'},
    { 'id' : 17, 'name' : 'Kentucky'},
    { 'id' : 18, 'name' : 'Louisiana'},
    { 'id' : 19, 'name' : 'Maine'},
    { 'id' : 21, 'name' : 'Maryland'},
    { 'id' : 22, 'name' : 'Massachusetts'},
    { 'id' : 23, 'name' : 'Michigan'},
    { 'id' : 24, 'name' : 'Minnesota'},
    { 'id' : 25, 'name' : 'Mississippi'},
    { 'id' : 26, 'name' : 'Missouri'},
    { 'id' : 27, 'name' : 'Montana'},
    { 'id' : 28, 'name' : 'Nebraska'},
    { 'id' : 29, 'name' : 'Nevada'},
    { 'id' : 30, 'name' : 'New Hampshire'},
    { 'id' : 31, 'name' : 'New Jersey'},
    { 'id' : 32, 'name' : 'New Mexico'},
    { 'id' : 33, 'name' : 'New York'},
    { 'id' : 34, 'name' : 'North Dakota'},
    { 'id' : 35, 'name' : 'North Carolina'},
    { 'id' : 36, 'name' : 'Ohio'},
    { 'id' : 37, 'name' : 'Oklahoma'},
    { 'id' : 38, 'name' : 'Oregon'},
    { 'id' : 39, 'name' : 'Pennsylvania'},
    { 'id' : 40, 'name' : 'Rhode Island'},
    { 'id' : 41, 'name' : 'South Carolina'},
    { 'id' : 42, 'name' : 'South Dakota'},
    { 'id' : 43, 'name' : 'Tennessee'},
    { 'id' : 44, 'name' : 'Texas'},
    { 'id' : 45, 'name' : 'Utah'},
    { 'id' : 46, 'name' : 'Vermont'},
    { 'id' : 47, 'name' : 'Virginia'},
    { 'id' : 48, 'name' : 'Washington'},
    { 'id' : 49, 'name' : 'West Virginia'},
    { 'id' : 50, 'name' : 'Wisconsin'},
    { 'id' : 51, 'name' : 'Wyoming'}
  ];

  List<State> statesObj = [
    State()..id = 1..name = 'Alabama',
    State()..id = 2..name = 'Alaska',
    State()..id = 3..name = 'Arizona',
    State()..id = 4..name = 'Arkansas',
    State()..id = 5..name = 'California',
    State()..id = 6..name = 'Colorado',
    State()..id = 7..name = 'Connecticut',
    State()..id = 8..name = 'Delaware',
    State()..id = 9..name = 'Florida',
    State()..id = 10..name = 'Georgia',
    State()..id = 11..name = 'Hawaii',
    State()..id = 12..name = 'Idaho',
    State()..id = 13..name = 'Illinois',
    State()..id = 14..name = 'Indiana',
    State()..id = 15..name = 'Iowa',
    State()..id = 16..name = 'Kansas',
    State()..id = 17..name = 'Kentucky',
    State()..id = 18..name = 'Louisiana',
    State()..id = 19..name = 'Maine',
    State()..id = 21..name = 'Maryland',
    State()..id = 22..name = 'Massachusetts',
    State()..id = 23..name = 'Michigan',
    State()..id = 24..name = 'Minnesota',
    State()..id = 25..name = 'Mississippi',
    State()..id = 26..name = 'Missouri',
    State()..id = 27..name = 'Montana',
    State()..id = 28..name = 'Nebraska',
    State()..id = 29..name = 'Nevada',
    State()..id = 30..name = 'New Hampshire',
    State()..id = 31..name = 'New Jersey',
    State()..id = 32..name = 'New Mexico',
    State()..id = 33..name = 'New York',
    State()..id = 34..name = 'North Dakota',
    State()..id = 35..name = 'North Carolina',
    State()..id = 36..name = 'Ohio',
    State()..id = 37..name = 'Oklahoma',
    State()..id = 38..name = 'Oregon',
    State()..id = 39..name = 'Pennsylvania',
    State()..id = 40..name = 'Rhode Island',
    State()..id = 41..name = 'South Carolina',
    State()..id = 42..name = 'South Dakota',
    State()..id = 43..name = 'Tennessee',
    State()..id = 44..name = 'Texas',
    State()..id = 45..name = 'Utah',
    State()..id = 46..name = 'Vermont',
    State()..id = 47..name = 'Virginia',
    State()..id = 48..name = 'Washington',
    State()..id = 49..name = 'West Virginia',
    State()..id = 50..name = 'Wisconsin',
    State()..id = 51..name = 'Wyoming'
  ];

  TypeaheadDemo get context => this;

  Future<Iterable<String>> getAsyncData(String queryStr) =>
    Future<Iterable<String>>.delayed(const Duration(seconds: 2), () {
      if (queryStr == '') return states;

      var query = RegExp(queryStr, caseSensitive: false);
      return states.where(query.hasMatch);
    });

  void changeTypeaheadLoading(e) {
    typeaheadLoading = e;
  }

  void changeTypeaheadNoResults(e) {
    typeaheadNoResults = e;
  }

  void typeaheadOnSelect(e) {
    print('Selected value: ${e}');
  }

  void addState(InputElement target) {
    statesComplex.add({'id': statesComplex.last['id'] + 1, 'name': target.value});
    target.value = '';
  }
}

@serializable
class State extends _$StateSerializable {
  @override
  int id;
  @override
  String name;

  @override
  String toString() => '{id: $id, name: $name}';
}
