import 'package:drift/drift.dart';

class Orders extends Table {
  TextColumn get id => text()();

  TextColumn get outletId => text()();

  RealColumn get latitude => real().nullable()();

  RealColumn get longitude => real().nullable()();

  RealColumn get accuracy => real().nullable()();

  DateTimeColumn get createdAt => dateTime()();

  IntColumn get version => integer()();

  TextColumn get status => text()();

  @override
  Set<Column> get primaryKey => {id};
}