import 'package:drift/drift.dart';

class OrderItems extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get orderId => text()();

  TextColumn get sku => text()();

  IntColumn get quantity => integer()();
}