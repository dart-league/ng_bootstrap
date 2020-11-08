// GENERATED CODE - DO NOT MODIFY BY HAND

part of table.table_data_complex;

// **************************************************************************
// SerializableGenerator
// **************************************************************************

abstract class _$EmployeeSerializable extends SerializableMap {
  String get name;
  String get position;
  String get office;
  String get ext;
  DateTime get startDate;
  double get salary;
  Address get address;
  set name(String v);
  set position(String v);
  set office(String v);
  set ext(String v);
  set startDate(DateTime v);
  set salary(double v);
  set address(Address v);

  operator [](Object __key) {
    switch (__key) {
      case 'name':
        return name;
      case 'position':
        return position;
      case 'office':
        return office;
      case 'ext':
        return ext;
      case 'startDate':
        return startDate;
      case 'salary':
        return salary;
      case 'address':
        return address;
    }
    throwFieldNotFoundException(__key, 'Employee');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'name':
        name = __value;
        return;
      case 'position':
        position = __value;
        return;
      case 'office':
        office = __value;
        return;
      case 'ext':
        ext = __value;
        return;
      case 'startDate':
        startDate = fromSerializedDateTime(__value);
        return;
      case 'salary':
        salary = __value;
        return;
      case 'address':
        address = fromSerialized(__value, () => Address());
        return;
    }
    throwFieldNotFoundException(__key, 'Employee');
  }

  Iterable<String> get keys => EmployeeClassMirror.fields.keys;
}

abstract class _$AddressSerializable extends SerializableMap {
  String get street;
  set street(String v);

  operator [](Object __key) {
    switch (__key) {
      case 'street':
        return street;
    }
    throwFieldNotFoundException(__key, 'Address');
  }

  operator []=(Object __key, __value) {
    switch (__key) {
      case 'street':
        street = __value;
        return;
    }
    throwFieldNotFoundException(__key, 'Address');
  }

  Iterable<String> get keys => AddressClassMirror.fields.keys;
}

// **************************************************************************
// MirrorsGenerator
// **************************************************************************

_Employee__Constructor([positionalParams, namedParams]) => Employee();

const $$Employee_fields_name = DeclarationMirror(
  name: 'name',
  type: String,
);
const $$Employee_fields_position = DeclarationMirror(
  name: 'position',
  type: String,
);
const $$Employee_fields_office = DeclarationMirror(
  name: 'office',
  type: String,
);
const $$Employee_fields_ext = DeclarationMirror(
  name: 'ext',
  type: String,
);
const $$Employee_fields_startDate = DeclarationMirror(
  name: 'startDate',
  type: DateTime,
);
const $$Employee_fields_salary = DeclarationMirror(
  name: 'salary',
  type: double,
);
const $$Employee_fields_address = DeclarationMirror(
  name: 'address',
  type: Address,
);

const EmployeeClassMirror = ClassMirror(name: 'Employee', constructors: {
  '': FunctionMirror(name: '', $call: _Employee__Constructor)
}, fields: {
  'name': $$Employee_fields_name,
  'position': $$Employee_fields_position,
  'office': $$Employee_fields_office,
  'ext': $$Employee_fields_ext,
  'startDate': $$Employee_fields_startDate,
  'salary': $$Employee_fields_salary,
  'address': $$Employee_fields_address
}, getters: [
  'name',
  'position',
  'office',
  'ext',
  'startDate',
  'salary',
  'address'
], setters: [
  'name',
  'position',
  'office',
  'ext',
  'startDate',
  'salary',
  'address'
]);

_Address__Constructor([positionalParams, namedParams]) => Address();

const $$Address_fields_street = DeclarationMirror(
  name: 'street',
  type: String,
);

const AddressClassMirror = ClassMirror(
    name: 'Address',
    constructors: {'': FunctionMirror(name: '', $call: _Address__Constructor)},
    fields: {'street': $$Address_fields_street},
    getters: ['street'],
    setters: ['street']);
