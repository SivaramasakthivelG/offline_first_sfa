import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_outlet/data/repositories/product_repository.dart';

import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository _repository;

  ProductCubit(this._repository) : super(const ProductState());

  void increaseQuantity(String sku) {
    final updatedProducts = state.products.map((product) {
      if (product.sku == sku) {
        return product.copyWith(
          quantity: product.quantity + 1,
        );
      }
      return product;
    }).toList();

    emit(
      state.copyWith(
        products: updatedProducts,
      ),
    );
  }

  void decreaseQuantity(String sku) {
    final updatedProducts = state.products.map((product) {
      if (product.sku == sku) {
        return product.copyWith(
          quantity: product.quantity > 0
              ? product.quantity - 1
              : 0,
        );
      }
      return product;
    }).toList();

    emit(
      state.copyWith(
        products: updatedProducts,
      ),
    );
  }

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