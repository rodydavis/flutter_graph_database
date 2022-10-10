import 'dart:convert';

import 'package:drift/drift.dart';

@DataClassName('Node')
class Nodes extends Table with AutoIncrementingPrimaryKey {
  TextColumn get data => text().map(const JsonMapper())();
  DateTimeColumn get created => dateTime()();
  DateTimeColumn get updated => dateTime()();
}

@DataClassName('Edge')
class Edges extends Table with AutoIncrementingPrimaryKey {
  TextColumn get data => text().map(const JsonMapper())();
  IntColumn get from => integer().references(Nodes, #id)();
  IntColumn get to => integer().references(Nodes, #id)();
  DateTimeColumn get created => dateTime()();
  DateTimeColumn get updated => dateTime()();
}

mixin AutoIncrementingPrimaryKey on Table {
  IntColumn get id => integer().autoIncrement()();
}

class JsonMapper extends TypeConverter<Map<String, dynamic>, String> {
  const JsonMapper();

  @override
  Map<String, dynamic> fromSql(String fromDb) => jsonDecode(fromDb);

  @override
  String toSql(Map<String, dynamic> value) => jsonEncode(value);
}
