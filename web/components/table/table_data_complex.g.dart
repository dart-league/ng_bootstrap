// GENERATED CODE - DO NOT MODIFY BY HAND

part of table.table_data_complex;

// **************************************************************************
// Generator: DsonGenerator
// Target: class Employee
// **************************************************************************

abstract class _$EmployeeSerializable extends SerializableMap {
  String get name;
  String get position;
  String get office;
  String get ext;
  DateTime get startDate;
  double get salary;
  Address get address;
  void set name(String v);
  void set position(String v);
  void set office(String v);
  void set ext(String v);
  void set startDate(DateTime v);
  void set salary(double v);
  void set address(Address v);

  operator [](Object key) {
    switch (key) {
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
    throwFieldNotFoundException(key, 'Employee');
  }

  operator []=(Object key, value) {
    switch (key) {
      case 'name':
        name = value;
        return;
      case 'position':
        position = value;
        return;
      case 'office':
        office = value;
        return;
      case 'ext':
        ext = value;
        return;
      case 'startDate':
        startDate = value;
        return;
      case 'salary':
        salary = value;
        return;
      case 'address':
        address = value;
        return;
    }
    throwFieldNotFoundException(key, 'Employee');
  }

  Iterable<String> get keys => EmployeeClassMirror.fields.keys;
}

_Employee__Constructor(params) => new Employee();

const $$Employee_fields_name = const DeclarationMirror(type: String);
const $$Employee_fields_position = const DeclarationMirror(type: String);
const $$Employee_fields_office = const DeclarationMirror(type: String);
const $$Employee_fields_ext = const DeclarationMirror(type: String);
const $$Employee_fields_startDate = const DeclarationMirror(type: DateTime);
const $$Employee_fields_salary = const DeclarationMirror(type: double);
const $$Employee_fields_address = const DeclarationMirror(type: Address);

const EmployeeClassMirror =
    const ClassMirror(name: 'Employee', constructors: const {
  '': const FunctionMirror(parameters: const {}, call: _Employee__Constructor)
}, fields: const {
  'name': $$Employee_fields_name,
  'position': $$Employee_fields_position,
  'office': $$Employee_fields_office,
  'ext': $$Employee_fields_ext,
  'startDate': $$Employee_fields_startDate,
  'salary': $$Employee_fields_salary,
  'address': $$Employee_fields_address
}, getters: const [
  'name',
  'position',
  'office',
  'ext',
  'startDate',
  'salary',
  'address'
], setters: const [
  'name',
  'position',
  'office',
  'ext',
  'startDate',
  'salary',
  'address'
]);

// **************************************************************************
// Generator: DsonGenerator
// Target: class Address
// **************************************************************************

abstract class _$AddressSerializable extends SerializableMap {
  String get street;
  void set street(String v);

  operator [](Object key) {
    switch (key) {
      case 'street':
        return street;
    }
    throwFieldNotFoundException(key, 'Address');
  }

  operator []=(Object key, value) {
    switch (key) {
      case 'street':
        street = value;
        return;
    }
    throwFieldNotFoundException(key, 'Address');
  }

  Iterable<String> get keys => AddressClassMirror.fields.keys;
}

_Address__Constructor(params) => new Address();

const $$Address_fields_street = const DeclarationMirror(type: String);

const AddressClassMirror =
    const ClassMirror(name: 'Address', constructors: const {
  '': const FunctionMirror(parameters: const {}, call: _Address__Constructor)
}, fields: const {
  'street': $$Address_fields_street
}, getters: const [
  'street'
], setters: const [
  'street'
]);
