import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_outlet/data/repositories/product_repository.dart';

import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository _repository;

  ProductCubit(this._repository) : super(const ProductState());

  Future<void> loadProducts() async {
    emit(
      state.copyWith(
        status: ProductStatus.loading,
      ),
    );

    try {
      final products = await _repository.getProducts();

      emit(
        state.copyWith(
          status: ProductStatus.success,
          products: products,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ProductStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}