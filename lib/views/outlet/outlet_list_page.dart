import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offline_outlet/core/di/injections.dart';
import 'package:offline_outlet/viewmodels/outlet/outlet_cubit.dart';
import 'package:offline_outlet/viewmodels/outlet/outlet_state.dart';
import 'package:offline_outlet/viewmodels/product/product_cubit.dart';
import 'package:offline_outlet/views/order/order_page.dart';

class OutletListPage extends StatelessWidget {
  const OutletListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Outlets'),
        centerTitle: true,
      ),
      body: BlocBuilder<OutletCubit, OutletState>(
        builder: (context, state) {
          switch (state.status) {
            case OutletStatus.initial:
            case OutletStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case OutletStatus.failure:
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 48,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      state.errorMessage ?? 'Something went wrong',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<OutletCubit>().loadOutlets();
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );

            case OutletStatus.success:
              if (state.outlets.isEmpty) {
                return const Center(
                  child: Text('No outlets found'),
                );
              }

              return RefreshIndicator(
                onRefresh: () =>
                    context.read<OutletCubit>().loadOutlets(),
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: state.outlets.length,
                  separatorBuilder: (_, __) =>
                  const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final outlet = state.outlets[index];

                    return Card(
                      elevation: 2,
                      child: ListTile(
                        leading: const CircleAvatar(
                          child: Icon(Icons.store),
                        ),
                        title: Text(outlet.name),
                        subtitle: Text(
                          'ID: ${outlet.id}\nVersion: ${outlet.version}',
                        ),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BlocProvider(
                                create: (_) => getIt<ProductCubit>()..loadProducts(),
                                child: OrderPage(
                                  outlet: outlet,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              );
          }
        },
      ),
    );
  }
}