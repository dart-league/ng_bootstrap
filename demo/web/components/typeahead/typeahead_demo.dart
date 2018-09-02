library typeahead.typeahead_demo;

import 'dart:async';

import 'dart:html';
import "package:angular/angular.dart";
import 'package:angular_forms/angular_forms.dart';
import 'package:dson/dson.dart';
import 'package:ng_bootstrap/ng_bootstrap.dart';

part 'typeahead_demo.g.dart';

@Component (selector: "typeahead-demo",
    templateUrl: 'typeahead_demo.html',
    directives: const [BsTypeAheadComponent, coreDirectives, formDirectives/*, BsRenderer*/])
class TypeaheadDemo {
  String selected = "";

  String selectedObj = "";

  var selectedItem;

  State selectedItemObj;

  String selectedAsync = "";

  var selectedItemAsync;

  bool typeaheadLoading = false;

  bool typeaheadNoResults = false;

  List<String> states = [
    "Alabama",
    "Alaska",
    "Arizona",
    "Arkansas",
    "California",
    "Colorado",
    "Connecticut",
    "Delaware",
    "Florida",
    "Georgia",
    "Hawaii",
    "Idaho",
    "Illinois",
    "Indiana",
    "Iowa",
    "Kansas",
    "Kentucky",
    "Louisiana",
    "Maine",
    "Maryland",
    "Massachusetts",
    "Michigan",
    "Minnesota",
    "Mississippi",
    "Missouri",
    "Montana",
    "Nebraska",
    "Nevada",
    "New Hampshire",
    "New Jersey",
    "New Mexico",
    "New York",
    "North Dakota",
    "North Carolina",
    "Ohio",
    "Oklahoma",
    "Oregon",
    "Pennsylvania",
    "Rhode Island",
    "South Carolina",
    "South Dakota",
    "Tennessee",
    "Texas",
    "Utah",
    "Vermont",
    "Virginia",
    "Washington",
    "West Virginia",
    "Wisconsin",
    "Wyoming"
  ];

  List<dynamic> statesComplex = [
    { "id" : 1, "name" : "Alabama"},
    { "id" : 2, "name" : "Alaska"},
    { "id" : 3, "name" : "Arizona"},
    { "id" : 4, "name" : "Arkansas"},
    { "id" : 5, "name" : "California"},
    { "id" : 6, "name" : "Colorado"},
    { "id" : 7, "name" : "Connecticut"},
    { "id" : 8, "name" : "Delaware"},
    { "id" : 9, "name" : "Florida"},
    { "id" : 10, "name" : "Georgia"},
    { "id" : 11, "name" : "Hawaii"},
    { "id" : 12, "name" : "Idaho"},
    { "id" : 13, "name" : "Illinois"},
    { "id" : 14, "name" : "Indiana"},
    { "id" : 15, "name" : "Iowa"},
    { "id" : 16, "name" : "Kansas"},
    { "id" : 17, "name" : "Kentucky"},
    { "id" : 18, "name" : "Louisiana"},
    { "id" : 19, "name" : "Maine"},
    { "id" : 21, "name" : "Maryland"},
    { "id" : 22, "name" : "Massachusetts"},
    { "id" : 23, "name" : "Michigan"},
    { "id" : 24, "name" : "Minnesota"},
    { "id" : 25, "name" : "Mississippi"},
    { "id" : 26, "name" : "Missouri"},
    { "id" : 27, "name" : "Montana"},
    { "id" : 28, "name" : "Nebraska"},
    { "id" : 29, "name" : "Nevada"},
    { "id" : 30, "name" : "New Hampshire"},
    { "id" : 31, "name" : "New Jersey"},
    { "id" : 32, "name" : "New Mexico"},
    { "id" : 33, "name" : "New York"},
    { "id" : 34, "name" : "North Dakota"},
    { "id" : 35, "name" : "North Carolina"},
    { "id" : 36, "name" : "Ohio"},
    { "id" : 37, "name" : "Oklahoma"},
    { "id" : 38, "name" : "Oregon"},
    { "id" : 39, "name" : "Pennsylvania"},
    { "id" : 40, "name" : "Rhode Island"},
    { "id" : 41, "name" : "South Carolina"},
    { "id" : 42, "name" : "South Dakota"},
    { "id" : 43, "name" : "Tennessee"},
    { "id" : 44, "name" : "Texas"},
    { "id" : 45, "name" : "Utah"},
    { "id" : 46, "name" : "Vermont"},
    { "id" : 47, "name" : "Virginia"},
    { "id" : 48, "name" : "Washington"},
    { "id" : 49, "name" : "West Virginia"},
    { "id" : 50, "name" : "Wisconsin"},
    { "id" : 51, "name" : "Wyoming"}
  ];

  List<State> statesObj = [
    new State()..id = 1..name = "Alabama",
    new State()..id = 2..name = "Alaska",
    new State()..id = 3..name = "Arizona",
    new State()..id = 4..name = "Arkansas",
    new State()..id = 5..name = "California",
    new State()..id = 6..name = "Colorado",
    new State()..id = 7..name = "Connecticut",
    new State()..id = 8..name = "Delaware",
    new State()..id = 9..name = "Florida",
    new State()..id = 10..name = "Georgia",
    new State()..id = 11..name = "Hawaii",
    new State()..id = 12..name = "Idaho",
    new State()..id = 13..name = "Illinois",
    new State()..id = 14..name = "Indiana",
    new State()..id = 15..name = "Iowa",
    new State()..id = 16..name = "Kansas",
    new State()..id = 17..name = "Kentucky",
    new State()..id = 18..name = "Louisiana",
    new State()..id = 19..name = "Maine",
    new State()..id = 21..name = "Maryland",
    new State()..id = 22..name = "Massachusetts",
    new State()..id = 23..name = "Michigan",
    new State()..id = 24..name = "Minnesota",
    new State()..id = 25..name = "Mississippi",
    new State()..id = 26..name = "Missouri",
    new State()..id = 27..name = "Montana",
    new State()..id = 28..name = "Nebraska",
    new State()..id = 29..name = "Nevada",
    new State()..id = 30..name = "New Hampshire",
    new State()..id = 31..name = "New Jersey",
    new State()..id = 32..name = "New Mexico",
    new State()..id = 33..name = "New York",
    new State()..id = 34..name = "North Dakota",
    new State()..id = 35..name = "North Carolina",
    new State()..id = 36..name = "Ohio",
    new State()..id = 37..name = "Oklahoma",
    new State()..id = 38..name = "Oregon",
    new State()..id = 39..name = "Pennsylvania",
    new State()..id = 40..name = "Rhode Island",
    new State()..id = 41..name = "South Carolina",
    new State()..id = 42..name = "South Dakota",
    new State()..id = 43..name = "Tennessee",
    new State()..id = 44..name = "Texas",
    new State()..id = 45..name = "Utah",
    new State()..id = 46..name = "Vermont",
    new State()..id = 47..name = "Virginia",
    new State()..id = 48..name = "Washington",
    new State()..id = 49..name = "West Virginia",
    new State()..id = 50..name = "Wisconsin",
    new State()..id = 51..name = "Wyoming"
  ];

  TypeaheadDemo get context => this;

  Future<Iterable<String>> getAsyncData(String queryStr) =>
    new Future<Iterable<String>>.delayed(const Duration(seconds: 2), () {
      if (queryStr == '') return states;

      var query = new RegExp(queryStr, caseSensitive: false);
      return states.where(query.hasMatch);
    });

  changeTypeaheadLoading(e) {
    this.typeaheadLoading = e;
  }

  changeTypeaheadNoResults(e) {
    this.typeaheadNoResults = e;
  }

  typeaheadOnSelect(e) {
    print('Selected value: ${e}');
  }

  addState(InputElement target) {
    statesComplex.add({'id': statesComplex.last['id'] + 1, 'name': target.value});
    target.value = '';
  }
}

@serializable
class State extends _$StateSerializable {
  int id;
  String name;

  toString() => '{id: $id, name: $name}';
}