// GENERATED CODE - DO NOT MODIFY BY HAND

part of table.table_data_complex;

// **************************************************************************
// DsonGenerator
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
        address = fromSerialized(__value, () => new Address());
        return;
    }
    throwFieldNotFoundException(__key, 'Employee');
  }

  Iterable<String> get keys => EmployeeClassMirror.fields.keys;
}

abstract class _$AddressSerializable extends SerializableMap {
  String get street;
  void set street(String v);

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

_Employee__Constructor([positionalParams, namedParams]) => new Employee();

const $$Employee_fields_name =
    const DeclarationMirror(name: 'name', type: String);
const $$Employee_fields_position =
    const DeclarationMirror(name: 'position', type: String);
const $$Employee_fields_office =
    const DeclarationMirror(name: 'office', type: String);
const $$Employee_fields_ext =
    const DeclarationMirror(name: 'ext', type: String);
const $$Employee_fields_startDate =
    const DeclarationMirror(name: 'startDate', type: DateTime);
const $$Employee_fields_salary =
    const DeclarationMirror(name: 'salary', type: double);
const $$Employee_fields_address =
    const DeclarationMirror(name: 'address', type: Address);

const EmployeeClassMirror =
    const ClassMirror(name: 'Employee', constructors: const {
  '': const FunctionMirror(name: '', $call: _Employee__Constructor)
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

_Address__Constructor([positionalParams, namedParams]) => new Address();

const $$Address_fields_street =
    const DeclarationMirror(name: 'street', type: String);

const AddressClassMirror = const ClassMirror(
    name: 'Address',
    constructors: const {
      '': const FunctionMirror(name: '', $call: _Address__Constructor)
    },
    fields: const {
      'street': $$Address_fields_street
    },
    getters: const [
      'street'
    ],
    setters: const [
      'street'
    ]);
