import 'package:equatable/equatable.dart';

import 'check_in_model.dart';
import 'order_item_model.dart';

enum OrderStatus {
  pending,
  syncing,
  synced,
  failed,
}

class OrderModel extends Equatable {
  final String id;
  final String outletId;
  final List<OrderItemModel> items;
  final CheckInModel? checkIn;
  final DateTime createdAt;
  final int version;
  final OrderStatus status;

  const OrderModel({
    required this.id,
    required this.outletId,
    required this.items,
    this.checkIn,
    required this.createdAt,
    required this.version,
    this.status = OrderStatus.pending,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      outletId: json['outletId'],
      items: (json['items'] as List)
          .map((e) => OrderItemModel.fromJson(e))
          .toList(),
      checkIn: json['checkIn'] != null
          ? CheckInModel.fromJson(json['checkIn'])
          : null,
      createdAt: DateTime.parse(json['createdAt']),
      version: json['version'],
      status: OrderStatus.values.firstWhere(
            (e) => e.name == json['status'],
        orElse: () => OrderStatus.pending,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'outletId': outletId,
      'items': items.map((e) => e.toJson()).toList(),
      'checkIn': checkIn?.toJson(),
      'createdAt': createdAt.toIso8601String(),
      'version': version,
      'status': status.name,
    };
  }

  OrderModel copyWith({
    String? id,
    String? outletId,
    List<OrderItemModel>? items,
    CheckInModel? checkIn,
    DateTime? createdAt,
    int? version,
    OrderStatus? status,
  }) {
    return OrderModel(
      id: id ?? this.id,
      outletId: outletId ?? this.outletId,
      items: items ?? this.items,
      checkIn: checkIn ?? this.checkIn,
      createdAt: createdAt ?? this.createdAt,
      version: version ?? this.version,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
    id,
    outletId,
    items,
    checkIn,
    createdAt,
    version,
    status,
  ];
}