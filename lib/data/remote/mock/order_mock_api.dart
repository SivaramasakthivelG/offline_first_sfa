import 'package:flutter/material.dart';
import 'package:offline_outlet/data/models/order_model.dart';

class OrderMockApi {
  Future<void> createOrder(OrderModel order) async {
    await Future.delayed(const Duration(seconds: 1));

    debugPrint('Order Created');
    debugPrint(order.toJson().toString());
  }
}