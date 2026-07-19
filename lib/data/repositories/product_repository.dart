import 'package:offline_outlet/data/models/product_model.dart';
import 'package:offline_outlet/data/remote/mock/product_mock_api.dart';

class ProductRepository {
  final ProductMockApi _mockApi;

  ProductRepository(this._mockApi);

  Future<List<ProductModel>> getProducts() {
    return _mockApi.fetchProducts();
  }
}