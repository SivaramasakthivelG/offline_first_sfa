import 'package:drift/drift.dart';


part 'outlet_dao.g.dart';

@DriftAccessor(tables: [Outlets])
class OutletDao extends DatabaseAccessor<AppDatabase> with _$OutletDaoMixin {
  OutletDao(super.db);

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