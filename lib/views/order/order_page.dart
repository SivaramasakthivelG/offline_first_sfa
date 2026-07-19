import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_outlet/data/models/outlet_model.dart';
import 'package:offline_outlet/viewmodels/product/product_cubit.dart';
import 'package:offline_outlet/viewmodels/product/product_state.dart';


class OrderPage extends StatelessWidget {
  final OutletModel outlet;

  const OrderPage({
    super.key,
    required this.outlet,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Order'),
      ),
        body: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            switch (state.status) {
              case ProductStatus.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case ProductStatus.failure:
                return Center(
                  child: Text(state.errorMessage ?? 'Something went wrong'),
                );

              case ProductStatus.success:
                return ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final product = state.products[index];

                    return ListTile(
                      title: Text(product.name),
                      subtitle: Text(product.sku),
                    );
                  },
                );

              case ProductStatus.initial:
              default:
                return const SizedBox.shrink();
            }
          },
        ),
    );
  }
}