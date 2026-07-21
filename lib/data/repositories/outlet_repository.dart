import '../local/database.dart';
import '../models/outlet_model.dart';
import '../remote/mock/outlet_mock_api.dart';

class OutletRepository {
  final OutletMockApi _mockApi;
  final AppDatabase _database;

  OutletRepository(
      this._mockApi,
      this._database,
      );

  Future<List<OutletModel>> getOutlets() async {
    try {
      // Fetch from API
      final outlets = await _mockApi.fetchOutlets();

      // Clear old cache
      await _database.clearOutlets();

      // Save latest data
      await _database.insertOutlets(
        outlets.map((e) => e.toCompanion()).toList(),
      );

      return outlets;
    } catch (_) {
      // If API fails, return cached data
      final cachedOutlets = await _database.getAllOutlets();

      return cachedOutlets
          .map((e) => OutletModel.fromDatabase(e))
          .toList();
    }
  }
}