import 'package:offline_outlet/data/models/product_model.dart';

class ProductMockApi {
  Future<List<ProductModel>> fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1));

    final response = [
      {
        "sku": "P-1",
        "name": "Rice",
      },
      {
        "sku": "P-2",
        "name": "Sugar",
      },
      {
        "sku": "P-3",
        "name": "Cooking Oil",
      },
      {
        "sku": "P-4",
        "name": "Soap",
      },
      {
        "sku": "P-5",
        "name": "Biscuits",
      },
    ];

    return response
        .map((json) => ProductModel.fromJson(json))
        .toList();
  }
}