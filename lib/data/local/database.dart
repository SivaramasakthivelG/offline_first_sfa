import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:offline_outlet/data/models/order_model.dart';
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

  // ---------------- Order Items ----------------

  Future<void> insertOrderItems(List<OrderItemsCompanion> items) async {
    await batch((batch) {
      batch.insertAll(orderItems, items);
    });
  }

  Future<List<OrderItem>> getOrderItems(String orderId) {
    return (select(orderItems)
      ..where((tbl) => tbl.orderId.equals(orderId)))
        .get();
  }

  // ---------------- Orders ----------------

  Future<void> insertOrder(OrdersCompanion order) {
    return into(orders).insertOnConflictUpdate(order);
  }

  Future<List<Order>> getAllOrders() {
    return select(orders).get();
  }

  Future<List<Order>> getPendingOrders() {
    return (select(orders)
      ..where((tbl) => tbl.status.equals(OrderStatus.pending.name)))
        .get();
  }


  // ---------------- Outlets ----------------

  Future<List<Outlet>> getAllOutlets() {
    return select(outlets).get();
  }

  Future<void> insertOutlets(List<OutletsCompanion> outletList) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(outlets, outletList);
    });
  }

  Future<void> clearOutlets() {
    return delete(outlets).go();
  }
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