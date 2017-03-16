// GENERATED CODE - DO NOT MODIFY BY HAND

part of typeahead.typeahead_demo;

// **************************************************************************
// Generator: DsonGenerator
// Target: class State
// **************************************************************************

abstract class _$StateSerializable extends SerializableMap {
  int get id;
  String get name;
  void set id(int v);
  void set name(String v);

  operator [](Object key) {
    switch (key) {
      case 'id':
        return id;
      case 'name':
        return name;
    }
    throwFieldNotFoundException(key, 'State');
  }

  operator []=(Object key, value) {
    switch (key) {
      case 'id':
        id = value;
        return;
      case 'name':
        name = value;
        return;
    }
    throwFieldNotFoundException(key, 'State');
  }

  get keys => StateClassMirror.fields.keys;
}

_State__Constructor(params) => new State();

const $$State_fields_id = const DeclarationMirror(type: int);
const $$State_fields_name = const DeclarationMirror(type: String);

const StateClassMirror = const ClassMirror(name: 'State', constructors: const {
  '': const FunctionMirror(parameters: const {}, call: _State__Constructor)
}, fields: const {
  'id': $$State_fields_id,
  'name': $$State_fields_name
}, getters: const [
  'id',
  'name'
], setters: const [
  'id',
  'name'
]);
