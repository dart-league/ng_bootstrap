// GENERATED CODE - DO NOT MODIFY BY HAND

part of table.table_demo;

// **************************************************************************
// SerializableGenerator
// **************************************************************************

abstract class _$PostSerializable extends SerializableMap {
  int get id;
  String get title;
  String get body;
  int get userId;
  set id(int v);
  set title(String v);
  set body(String v);
  set userId(int v);

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

_Post__Constructor([positionalParams, namedParams]) => Post();

const $$Post_fields_id = DeclarationMirror(
  name: 'id',
  type: int,
);
const $$Post_fields_title = DeclarationMirror(
  name: 'title',
  type: String,
);
const $$Post_fields_body = DeclarationMirror(
  name: 'body',
  type: String,
);
const $$Post_fields_userId = DeclarationMirror(
  name: 'userId',
  type: int,
);

const PostClassMirror = ClassMirror(name: 'Post', constructors: {
  '': FunctionMirror(name: '', $call: _Post__Constructor)
}, fields: {
  'id': $$Post_fields_id,
  'title': $$Post_fields_title,
  'body': $$Post_fields_body,
  'userId': $$Post_fields_userId
}, getters: [
  'id',
  'title',
  'body',
  'userId'
], setters: [
  'id',
  'title',
  'body',
  'userId'
]);
