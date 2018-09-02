library table.table_data_complex;

import 'package:dson/dson.dart';

part 'table_data_complex.g.dart';

@serializable
class Employee extends _$EmployeeSerializable {
  String name;
  String position;
  String office;
  String ext;
  DateTime startDate;
  double salary;
  Address address;
}

@serializable
class Address extends _$AddressSerializable {
  String street;
}

final List<Employee> dataComplex = [
  new Employee()
    ..name = 'Victoria Cantrell'
    ..position = 'Integer Corporation'
    ..office = 'Croatia'
    ..ext = '0839'
    ..startDate = DateTime.parse('2015-08-19')
    ..salary = 208.178
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Pearl Crosby'
    ..position = 'In PC'
    ..office = 'Cambodia'
    ..ext = '8262'
    ..startDate = DateTime.parse('2014-10-08')
    ..salary = 114.367
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Colette Foley'
    ..position = 'Lorem Inc.'
    ..office = 'Korea, North'
    ..ext = '8968'
    ..startDate = DateTime.parse('2015-07-19')
    ..salary = 721.473
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Anastasia Shaffer'
    ..position = 'Dolor Nulla Semper LLC'
    ..office = 'Suriname'
    ..ext = '7980'
    ..startDate = DateTime.parse('2015-04-20')
    ..salary = 264.620
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Gabriel Castro'
    ..position = 'Sed Limited'
    ..office = 'Bahrain'
    ..ext = '0757'
    ..startDate = DateTime.parse('2015-03-04')
    ..salary = 651.350
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Cherokee Ware'
    ..position = 'Tincidunt LLC'
    ..office = 'United Kingdom (Great Britain)'
    ..ext = '3995'
    ..startDate = DateTime.parse('2015-06-17')
    ..salary = 666.259
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Barry Moss'
    ..position = 'Sociis Industries'
    ..office = 'Western Sahara'
    ..ext = '6697'
    ..startDate = DateTime.parse('2015-08-13')
    ..salary = 541.631
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Maryam Tucker'
    ..position = 'Elit Pede Malesuada Inc.'
    ..office = 'Brazil'
    ..ext = '5203'
    ..startDate = DateTime.parse('2014-10-02')
    ..salary = 182.294
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Constance Clayton'
    ..position = 'Auctor Velit Aliquam LLP'
    ..office = 'United Arab Emirates'
    ..ext = '4204'
    ..startDate = DateTime.parse('2015-08-01')
    ..salary = 218.597
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Rogan Tucker'
    ..position = 'Arcu Vestibulum Ante Associates'
    ..office = 'Jersey'
    ..ext = '0885'
    ..startDate = DateTime.parse('2015-01-04')
    ..salary = 861.632
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Emery Mcdowell'
    ..position = 'Gravida Company'
    ..office = 'New Zealand'
    ..ext = '3951'
    ..startDate = DateTime.parse('2015-06-02')
    ..salary = 413.568
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Yael Greer'
    ..position = 'Orci Limited'
    ..office = 'Madagascar'
    ..ext = '1416'
    ..startDate = DateTime.parse('2014-12-04')
    ..salary = 121.831
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Jared Burgess'
    ..position = 'Auctor Incorporated'
    ..office = 'Burundi'
    ..ext = '4673'
    ..startDate = DateTime.parse('2015-01-12')
    ..salary = 62.243
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Sharon Campbell'
    ..position = 'Elit Curabitur Sed Consulting'
    ..office = 'Comoros'
    ..ext = '6274'
    ..startDate = DateTime.parse('2014-09-14')
    ..salary = 200.854
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Yeo Church'
    ..position = 'Donec Vitae Erat PC'
    ..office = 'Saudi Arabia'
    ..ext = '0269'
    ..startDate = DateTime.parse('2015-06-07')
    ..salary = 581.193
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Kylie Barlow'
    ..position = 'Fermentum Risus Corporation'
    ..office = 'Papua New Guinea'
    ..ext = '2010'
    ..startDate = DateTime.parse('2014-12-03')
    ..salary = 418.115
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Nell Leonard'
    ..position = 'Vestibulum Consulting'
    ..office = 'Saudi Arabia'
    ..ext = '4839'
    ..startDate = DateTime.parse('2015-05-29')
    ..salary = 466.201
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Brandon Fleming'
    ..position = 'Donec Egestas Associates'
    ..office = 'Poland'
    ..ext = '0622'
    ..startDate = DateTime.parse('2015-01-22')
    ..salary = 800.011
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Inga Pena'
    ..position = 'Et Magnis Dis Limited'
    ..office = 'Belgium'
    ..ext = '8140'
    ..startDate = DateTime.parse('2015-05-18')
    ..salary = 564.245
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Arden Russo'
    ..position = 'Est Tempor Bibendum Corp.'
    ..office = 'Dominican Republic'
    ..ext = '6774'
    ..startDate = DateTime.parse('2015-07-23')
    ..salary = 357.222
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Liberty Gallegos'
    ..position = 'Nec Diam LLC'
    ..office = 'Ghana'
    ..ext = '9266'
    ..startDate = DateTime.parse('2015-06-18')
    ..salary = 554.375
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Dennis York'
    ..position = 'Nullam Suscipit Foundation'
    ..office = 'Namibia'
    ..ext = '3133'
    ..startDate = DateTime.parse('2015-03-20')
    ..salary = 90.417
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Petra Chandler'
    ..position = 'Pede Nonummy Inc.'
    ..office = 'Namibia'
    ..ext = '3367'
    ..startDate = DateTime.parse('2015-03-26')
    ..salary = 598.915
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Aurelia Marshall'
    ..position = 'Donec Consulting'
    ..office = 'Nicaragua'
    ..ext = '2690'
    ..startDate = DateTime.parse('2015-08-18')
    ..salary = 201.680
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Rose Carter'
    ..position = 'Enim Consequat Purus Industries'
    ..office = 'Morocco'
    ..ext = '0619'
    ..startDate = DateTime.parse('2015-03-06')
    ..salary = 220.187
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Denton Atkins'
    ..position = 'Non Vestibulum PC'
    ..office = 'Mali'
    ..ext = '5806'
    ..startDate = DateTime.parse('2015-04-19')
    ..salary = 324.588
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Germaine Osborn'
    ..position = 'Tristique Aliquet PC'
    ..office = 'Lesotho'
    ..ext = '4469'
    ..startDate = DateTime.parse('2015-01-19')
    ..salary = 351.108
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Nell Butler'
    ..position = 'Sit Amet Dapibus Industries'
    ..office = 'Cuba'
    ..ext = '7860'
    ..startDate = DateTime.parse('2015-01-06')
    ..salary = 230.072
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Brent Stein'
    ..position = 'Eu Augue Porttitor LLP'
    ..office = 'Cyprus'
    ..ext = '4697'
    ..startDate = DateTime.parse('2014-11-02')
    ..salary = 853.413
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Alexandra Shaw'
    ..position = 'Aenean Gravida Limited'
    ..office = 'Uruguay'
    ..ext = '1140'
    ..startDate = DateTime.parse('2015-05-16')
    ..salary = 401.970
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Veronica Allison'
    ..position = 'Aliquet Diam Sed Institute'
    ..office = 'Samoa'
    ..ext = '9966'
    ..startDate = DateTime.parse('2015-05-17')
    ..salary = 79.193
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Katelyn Gamble'
    ..position = 'Sed Associates'
    ..office = 'Mauritius'
    ..ext = '4767'
    ..startDate = DateTime.parse('2015-03-20')
    ..salary = 484.299
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'James Greer'
    ..position = 'A Dui Incorporated'
    ..office = 'Norway'
    ..ext = '5517'
    ..startDate = DateTime.parse('2015-02-21')
    ..salary = 333.518
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Cain Vasquez'
    ..position = 'Nulla Facilisis Suspendisse Institute'
    ..office = 'China'
    ..ext = '3179'
    ..startDate = DateTime.parse('2015-05-27')
    ..salary = 651.761
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Shaeleigh Barr'
    ..position = 'Eleifend Cras Institute'
    ..office = 'Ghana'
    ..ext = '5904'
    ..startDate = DateTime.parse('2015-04-01')
    ..salary = 627.095
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Baker Mckay'
    ..position = 'Ut Sagittis Associates'
    ..office = 'Isle of Man'
    ..ext = '9840'
    ..startDate = DateTime.parse('2015-01-12')
    ..salary = 742.247
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Jayme Pace'
    ..position = 'Cras Eu Tellus Associates'
    ..office = 'Bouvet Island'
    ..ext = '4580'
    ..startDate = DateTime.parse('2015-08-12')
    ..salary = 591.588
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Reuben Albert'
    ..position = 'Lobortis Institute'
    ..office = 'Zambia'
    ..ext = '8725'
    ..startDate = DateTime.parse('2015-04-04')
    ..salary = 791.408
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Idola Burns'
    ..position = 'Non Industries'
    ..office = 'Myanmar'
    ..ext = '3201'
    ..startDate = DateTime.parse('2015-06-24')
    ..salary = 142.906
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Laura Macias'
    ..position = 'Phasellus Inc.'
    ..office = 'Mauritania'
    ..ext = '2033'
    ..startDate = DateTime.parse('2014-11-21')
    ..salary = 226.591
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Nichole Salas'
    ..position = 'Duis PC'
    ..office = 'Madagascar'
    ..ext = '4397'
    ..startDate = DateTime.parse('2015-01-18')
    ..salary = 234.196
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Hunter Walter'
    ..position = 'Ullamcorper Duis Cursus Foundation'
    ..office = 'Brazil'
    ..ext = '2227'
    ..startDate = DateTime.parse('2015-02-28')
    ..salary = 655.052
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Asher Rich'
    ..position = 'Mauris Ipsum LLP'
    ..office = 'Paraguay'
    ..ext = '7288'
    ..startDate = DateTime.parse('2015-08-08')
    ..salary = 222.946
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Angela Carlson'
    ..position = 'Donec Tempor Institute'
    ..office = 'Papua New Guinea'
    ..ext = '5416'
    ..startDate = DateTime.parse('2015-02-12')
    ..salary = 562.194
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'James Dorsey'
    ..position = 'Ipsum Leo Associates'
    ..office = 'Congo (Brazzaville)'
    ..ext = '6019'
    ..startDate = DateTime.parse('2015-01-10')
    ..salary = 629.925
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Wesley Cobb'
    ..position = 'Nunc Est Incorporated'
    ..office = 'Australia'
    ..ext = '6466'
    ..startDate = DateTime.parse('2015-01-30')
    ..salary = 343.476
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Meghan Stephens'
    ..position = 'Interdum PC'
    ..office = 'Turkey'
    ..ext = '8001'
    ..startDate = DateTime.parse('2014-10-11')
    ..salary = 469.305
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Bertha Herrera'
    ..position = 'Amet Limited'
    ..office = 'Kenya'
    ..ext = '4799'
    ..startDate = DateTime.parse('2014-11-22')
    ..salary = 56.606
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Karina Key'
    ..position = 'Quisque Varius Nam Company'
    ..office = 'France'
    ..ext = '3907'
    ..startDate = DateTime.parse('2015-03-26')
    ..salary = 314.260
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Uriel Carson'
    ..position = 'Penatibus PC'
    ..office = 'Venezuela'
    ..ext = '5902'
    ..startDate = DateTime.parse('2015-01-07')
    ..salary = 106.335
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Mira Baird'
    ..position = 'Felis Orci PC'
    ..office = 'Niue'
    ..ext = '4189'
    ..startDate = DateTime.parse('2015-08-25')
    ..salary = 515.671
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Ursula Parrish'
    ..position = 'Ac Corporation'
    ..office = 'Macao'
    ..ext = '4771'
    ..startDate = DateTime.parse('2015-06-30')
    ..salary = 72.295
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Josephine Sykes'
    ..position = 'Blandit Congue Limited'
    ..office = 'Holy See (Vatican City State)'
    ..ext = '4684'
    ..startDate = DateTime.parse('2014-12-22')
    ..salary = 694.656
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Maggie Sims'
    ..position = 'Vulputate Posuere Industries'
    ..office = 'Sudan'
    ..ext = '6482'
    ..startDate = DateTime.parse('2014-11-22')
    ..salary = 363.743
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Rogan Fuentes'
    ..position = 'Vestibulum Accumsan Neque Company'
    ..office = 'Jersey'
    ..ext = '4837'
    ..startDate = DateTime.parse('2015-07-29')
    ..salary = 606.004
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Maya Haney'
    ..position = 'Ac Foundation'
    ..office = 'Falkland Islands'
    ..ext = '5752'
    ..startDate = DateTime.parse('2015-09-03')
    ..salary = 745.500
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Aquila Battle'
    ..position = 'Sociis Natoque Penatibus Foundation'
    ..office = 'Azerbaijan'
    ..ext = '8470'
    ..startDate = DateTime.parse('2015-03-06')
    ..salary = 582.265
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Connor Coleman'
    ..position = 'Orci Lacus Vestibulum Foundation'
    ..office = 'Croatia'
    ..ext = '6217'
    ..startDate = DateTime.parse('2014-10-21')
    ..salary = 416.958
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Charity Thomas'
    ..position = 'Convallis Ligula Donec Inc.'
    ..office = 'Benin'
    ..ext = '6240'
    ..startDate = DateTime.parse('2015-07-12')
    ..salary = 540.999
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Blythe Powers'
    ..position = 'Amet Orci Limited'
    ..office = 'Falkland Islands'
    ..ext = '5608'
    ..startDate = DateTime.parse('2015-01-23')
    ..salary = 480.067
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Adria Battle'
    ..position = 'Ornare Lectus Incorporated'
    ..office = 'British Indian Ocean Territory'
    ..ext = '7419'
    ..startDate = DateTime.parse('2015-05-28')
    ..salary = 257.937
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Melanie Mcintyre'
    ..position = 'Nunc Corp.'
    ..office = 'Mongolia'
    ..ext = '4326'
    ..startDate = DateTime.parse('2015-01-06')
    ..salary = 359.737
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Keely Bauer'
    ..position = 'Nec Tempus Institute'
    ..office = 'Somalia'
    ..ext = '8372'
    ..startDate = DateTime.parse('2015-03-09')
    ..salary = 99.718
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Noelani Strong'
    ..position = 'Nec LLP'
    ..office = 'Iran'
    ..ext = '0049'
    ..startDate = DateTime.parse('2015-08-24')
    ..salary = 480.718
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Jeanette Henderson'
    ..position = 'Eu Elit Nulla Corporation'
    ..office = 'Italy'
    ..ext = '7586'
    ..startDate = DateTime.parse('2015-06-19')
    ..salary = 253.772
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Candace Huber'
    ..position = 'Sed Institute'
    ..office = 'Uganda'
    ..ext = '7183'
    ..startDate = DateTime.parse('2015-06-16')
    ..salary = 388.879
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Bethany Potter'
    ..position = 'Vivamus Nibh Dolor Incorporated'
    ..office = 'Puerto Rico'
    ..ext = '3354'
    ..startDate = DateTime.parse('2014-11-12')
    ..salary = 747.310
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Whoopi Burks'
    ..position = 'Justo Inc.'
    ..office = 'Fiji'
    ..ext = '2185'
    ..startDate = DateTime.parse('2014-09-24')
    ..salary = 803.037
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Sheila Long'
    ..position = 'Diam Associates'
    ..office = 'Sao Tome and Principe'
    ..ext = '7760'
    ..startDate = DateTime.parse('2014-12-21')
    ..salary = 674.379
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Sonya Church'
    ..position = 'Laoreet Institute'
    ..office = 'Grenada'
    ..ext = '8920'
    ..startDate = DateTime.parse('2015-06-03')
    ..salary = 625.147
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Shaine Forbes'
    ..position = 'Eu Arcu LLP'
    ..office = 'Cyprus'
    ..ext = '2369'
    ..startDate = DateTime.parse('2015-01-18')
    ..salary = 208.100
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Alexandra Patrick'
    ..position = 'Ligula Donec Inc.'
    ..office = 'Viet Nam'
    ..ext = '8531'
    ..startDate = DateTime.parse('2015-04-09')
    ..salary = 104.063
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Patience Vincent'
    ..position = 'Sem Molestie Associates'
    ..office = 'Philippines'
    ..ext = '8888'
    ..startDate = DateTime.parse('2015-07-04')
    ..salary = 673.556
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Evelyn Smith'
    ..position = 'Fusce Industries'
    ..office = 'Togo'
    ..ext = '5051'
    ..startDate = DateTime.parse('2015-08-15')
    ..salary = 737.284
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Kieran Gonzalez'
    ..position = 'Non Corp.'
    ..office = 'Equatorial Guinea'
    ..ext = '4834'
    ..startDate = DateTime.parse('2015-08-24')
    ..salary = 90.195
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Molly Oneil'
    ..position = 'Non Dui Consulting'
    ..office = 'Belize'
    ..ext = '7501'
    ..startDate = DateTime.parse('2014-10-28')
    ..salary = 140.767
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Nigel Davenport'
    ..position = 'Ullamcorper Velit In Industries'
    ..office = 'Vanuatu'
    ..ext = '0976'
    ..startDate = DateTime.parse('2015-03-16')
    ..salary = 70.536
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Thor Young'
    ..position = 'Malesuada Consulting'
    ..office = 'French Southern Territories'
    ..ext = '0211'
    ..startDate = DateTime.parse('2015-01-28')
    ..salary = 75.501
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Finn Delacruz'
    ..position = 'Lorem Industries'
    ..office = 'Cocos (Keeling) Islands'
    ..ext = '2980'
    ..startDate = DateTime.parse('2014-12-11')
    ..salary = 754.967
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Lane Henderson'
    ..position = 'Pede Foundation'
    ..office = 'Kazakhstan'
    ..ext = '1446'
    ..startDate = DateTime.parse('2015-07-02')
    ..salary = 842.050
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Shea Potter'
    ..position = 'Curabitur Limited'
    ..office = 'Timor-Leste'
    ..ext = '4654'
    ..startDate = DateTime.parse('2015-05-07')
    ..salary = 263.629
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Brynn Yang'
    ..position = 'Ut Limited'
    ..office = 'Mayotte'
    ..ext = '4668'
    ..startDate = DateTime.parse('2015-01-17')
    ..salary = 74.292
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Kylan Fuentes'
    ..position = 'Sapien Aenean Associates'
    ..office = 'Brazil'
    ..ext = '6623'
    ..startDate = DateTime.parse('2014-12-28')
    ..salary = 108.632
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Lionel Mcbride'
    ..position = 'Ipsum PC'
    ..office = 'Portugal'
    ..ext = '3978'
    ..startDate = DateTime.parse('2015-07-11')
    ..salary = 34.244
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Paul Lucas'
    ..position = 'Eget LLP'
    ..office = 'Nicaragua'
    ..ext = '8890'
    ..startDate = DateTime.parse('2014-09-30')
    ..salary = 690.834
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Lareina Williamson'
    ..position = 'Imperdiet Ullamcorper Ltd'
    ..office = 'Cocos (Keeling) Islands'
    ..ext = '9489'
    ..startDate = DateTime.parse('2014-12-01')
    ..salary = 603.498
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Amy Acevedo'
    ..position = 'Id Institute'
    ..office = 'Cook Islands'
    ..ext = '5592'
    ..startDate = DateTime.parse('2015-02-04')
    ..salary = 125.165
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Nomlanga Silva'
    ..position = 'Eget LLC'
    ..office = 'Belize'
    ..ext = '3110'
    ..startDate = DateTime.parse('2015-01-31')
    ..salary = 268.509
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Amena Stone'
    ..position = 'Enim Incorporated'
    ..office = 'Guinea'
    ..ext = '1211'
    ..startDate = DateTime.parse('2014-09-23')
    ..salary = 214.381
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Danielle Coffey'
    ..position = 'Feugiat Placerat Corp.'
    ..office = 'Sao Tome and Principe'
    ..ext = '8176'
    ..startDate = DateTime.parse('2015-06-17')
    ..salary = 137.423
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Buffy Russell'
    ..position = 'Lacus Quisque Ltd'
    ..office = 'Ecuador'
    ..ext = '6741'
    ..startDate = DateTime.parse('2014-10-17')
    ..salary = 612.184
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Kaitlin Lamb'
    ..position = 'Malesuada Fringilla Est Associates'
    ..office = 'Algeria'
    ..ext = '5054'
    ..startDate = DateTime.parse('2014-10-18')
    ..salary = 327.367
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Leilani Yates'
    ..position = 'Mus Proin LLC'
    ..office = 'South Sudan'
    ..ext = '1550'
    ..startDate = DateTime.parse('2015-05-27')
    ..salary = 743.493
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Jemima Moon'
    ..position = 'Phasellus Corp.'
    ..office = 'South Georgia and The South Sandwich Islands'
    ..ext = '7582'
    ..startDate = DateTime.parse('2015-05-21')
    ..salary = 496.067
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Hiroko Schwartz'
    ..position = 'Neque Institute'
    ..office = 'Saint Vincent and The Grenadines'
    ..ext = '9368'
    ..startDate = DateTime.parse('2015-03-13')
    ..salary = 178.782
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Nathaniel Jensen'
    ..position = 'Mi Tempor Limited'
    ..office = 'Dominica'
    ..ext = '8331'
    ..startDate = DateTime.parse('2014-12-05')
    ..salary = 37.441
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Silas Sweeney'
    ..position = 'Ultrices Institute'
    ..office = 'Turkmenistan'
    ..ext = '0746'
    ..startDate = DateTime.parse('2014-11-13')
    ..salary = 152.980
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Jermaine Barry'
    ..position = 'Dapibus Corporation'
    ..office = 'Uzbekistan'
    ..ext = '1545'
    ..startDate = DateTime.parse('2015-03-06')
    ..salary = 409.463
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Tatiana Nichols'
    ..position = 'Nec Diam Industries'
    ..office = 'Cook Islands'
    ..ext = '4395'
    ..startDate = DateTime.parse('2015-05-22')
    ..salary = 51.155
    ..address = (new Address()
      ..street = 'str1'),
  new Employee()
    ..name = 'Rama Waller'
    ..position = 'Sem Pellentesque LLC'
    ..office = 'Andorra'
    ..ext = '2973'
    ..startDate = DateTime.parse('2014-12-01')
    ..salary = 223.227
    ..address = (new Address()
      ..street = 'str1')
];
