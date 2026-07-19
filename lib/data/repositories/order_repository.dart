import 'package:offline_outlet/data/models/order_model.dart';
import 'package:offline_outlet/data/remote/mock/order_mock_api.dart';

class OrderRepository {
  final OrderMockApi _mockApi;

  OrderRepository(this._mockApi);

  Future<void> createOrder(OrderModel order) {
    return _mockApi.createOrder(order);
  }
}