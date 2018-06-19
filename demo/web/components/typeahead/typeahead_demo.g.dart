// GENERATED CODE - DO NOT MODIFY BY HAND

part of typeahead.typeahead_demo;

// **************************************************************************
// DsonGenerator
// **************************************************************************

abstract class _$StateSerializable extends SerializableMap {
  int get id;
  String get name;
  void set id(int v);
  void set name(String v);
  String toString();

  operator [](Object __key) {
    switch (__key) {
      case 'id':
        return id;
      case 'name':
        return name;
      case 'toString':
        return toString;
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
// MirrorsGenerator
// **************************************************************************

_State__Constructor([positionalParams, namedParams]) => new State();

const $$State_fields_id = const DeclarationMirror(name: 'id', type: int);
const $$State_fields_name = const DeclarationMirror(name: 'name', type: String);

const StateClassMirror = const ClassMirror(name: 'State', constructors: const {
  '': const FunctionMirror(name: '', $call: _State__Constructor)
}, fields: const {
  'id': $$State_fields_id,
  'name': $$State_fields_name
}, getters: const [
  'id',
  'name'
], setters: const [
  'id',
  'name'
], methods: const {
  'toString': const FunctionMirror(
    name: 'toString',
    returnType: String,
  )
});
