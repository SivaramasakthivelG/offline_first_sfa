

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_outlet/data/models/order_model.dart';
import 'package:offline_outlet/data/repositories/order_repository.dart';
import 'package:offline_outlet/viewmodels/order/order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepository _repository;

  OrderCubit(this._repository) : super(const OrderState());

  Future<void> createOrder(OrderModel order) async {
    emit(
      state.copyWith(
        status: OrderStateStatus.loading,
        errorMessage: null,
      ),
    );

    try {
      await _repository.createOrder(order);

      emit(
        state.copyWith(
          status: OrderStateStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: OrderStateStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}