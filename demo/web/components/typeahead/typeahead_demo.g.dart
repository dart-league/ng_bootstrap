// GENERATED CODE - DO NOT MODIFY BY HAND

part of typeahead.typeahead_demo;

// **************************************************************************
// Generator: DsonGenerator
// **************************************************************************

abstract class _$StateSerializable extends SerializableMap {
  int get id;
  String get name;
  void set id(int v);
  void set name(String v);

  operator [](Object __key) {
    switch (__key) {
      case 'id':
        return id;
      case 'name':
        return name;
    }
    throwFieldNotFoundException(__key, 'State');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'id':
        id = __value;
        return;
      case 'name':
        name = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'State');
  }

  Iterable<String> get keys => StateClassMirror.fields.keys;
}

// **************************************************************************
// Generator: MirrorsGenerator
// **************************************************************************

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
