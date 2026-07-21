import 'package:drift/drift.dart';

class Outlets extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()();

  RealColumn get latitude => real()();

  RealColumn get longitude => real()();

  DateTimeColumn get updatedAt => dateTime()();

  IntColumn get version => integer()();

  @override
  Set<Column> get primaryKey => {id};
}