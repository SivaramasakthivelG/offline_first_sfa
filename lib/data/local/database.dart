import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables/order_items_table.dart';
import 'tables/orders_table.dart';
import 'tables/outlets_table.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    Outlets,
    Orders,
    OrderItems,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();

    final file = File(
      p.join(dir.path, 'field_order_capture.db'),
    );

    return NativeDatabase(file);
  });
}