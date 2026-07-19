import 'package:equatable/equatable.dart';

enum OrderStateStatus {
  initial,
  loading,
  success,
  failure,
}

class OrderState extends Equatable {
  final OrderStateStatus status;
  final String? errorMessage;

  const OrderState({
    this.status = OrderStateStatus.initial,
    this.errorMessage,
  });

  OrderState copyWith({
    OrderStateStatus? status,
    String? errorMessage,
  }) {
    return OrderState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    errorMessage,
  ];
}