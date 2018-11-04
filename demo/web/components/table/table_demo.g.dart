// GENERATED CODE - DO NOT MODIFY BY HAND

part of table.table_demo;

// **************************************************************************
// DsonGenerator
// **************************************************************************

abstract class _$PostSerializable extends SerializableMap {
  int get id;
  String get title;
  String get body;
  int get userId;
  void set id(int v);
  void set title(String v);
  void set body(String v);
  void set userId(int v);

  operator [](Object __key) {
    switch (__key) {
      case 'id':
        return id;
      case 'title':
        return title;
      case 'body':
        return body;
      case 'userId':
        return userId;
    }
    throwFieldNotFoundException(__key, 'Post');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'id':
        id = __value;
        return;
      case 'title':
        title = __value;
        return;
      case 'body':
        body = __value;
        return;
      case 'userId':
        userId = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'Post');
  }

  Iterable<String> get keys => PostClassMirror.fields.keys;
}

// **************************************************************************
// MirrorsGenerator
// **************************************************************************

_Post__Constructor([positionalParams, namedParams]) => new Post();

const $$Post_fields_id = const DeclarationMirror(name: 'id', type: int);
const $$Post_fields_title =
    const DeclarationMirror(name: 'title', type: String);
const $$Post_fields_body = const DeclarationMirror(name: 'body', type: String);
const $$Post_fields_userId = const DeclarationMirror(name: 'userId', type: int);

const PostClassMirror = const ClassMirror(name: 'Post', constructors: const {
  '': const FunctionMirror(name: '', $call: _Post__Constructor)
}, fields: const {
  'id': $$Post_fields_id,
  'title': $$Post_fields_title,
  'body': $$Post_fields_body,
  'userId': $$Post_fields_userId
}, getters: const [
  'id',
  'title',
  'body',
  'userId'
], setters: const [
  'id',
  'title',
  'body',
  'userId'
]);
