import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/outlet_repository.dart';
import 'outlet_state.dart';

class OutletCubit extends Cubit<OutletState> {
  final OutletRepository _repository;

  OutletCubit(this._repository) : super(const OutletState());

  Future<void> loadOutlets() async {
    emit(state.copyWith(status: OutletStatus.loading));

    try {
      final outlets = await _repository.getOutlets();

      emit(
        state.copyWith(
          status: OutletStatus.success,
          outlets: outlets,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: OutletStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}