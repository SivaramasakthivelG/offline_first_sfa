import 'package:equatable/equatable.dart';

class OrderItemModel extends Equatable {
  final String sku;
  final int quantity;

  const OrderItemModel({
    required this.sku,
    required this.quantity,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      sku: json['sku'],
      quantity: json['qty'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sku': sku,
      'qty': quantity,
    };
  }

  @override
  List<Object> get props => [
    sku,
    quantity,
  ];
}