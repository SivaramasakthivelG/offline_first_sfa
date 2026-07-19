import '../models/outlet_model.dart';
import '../remote/mock/outlet_mock_api.dart';

class OutletRepository {
  final OutletMockApi _mockApi;

  OutletRepository(this._mockApi);

  Future<List<OutletModel>> getOutlets() async {
    return await _mockApi.fetchOutlets();
  }
}