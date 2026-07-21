import 'package:get_it/get_it.dart';
import 'package:offline_outlet/data/remote/mock/order_mock_api.dart';
import 'package:offline_outlet/data/remote/mock/outlet_mock_api.dart';
import 'package:offline_outlet/data/remote/mock/product_mock_api.dart';
import 'package:offline_outlet/data/repositories/order_repository.dart';
import 'package:offline_outlet/data/repositories/outlet_repository.dart';
import 'package:offline_outlet/data/repositories/product_repository.dart';
import 'package:offline_outlet/viewmodels/outlet/outlet_cubit.dart';
import 'package:offline_outlet/data/local/database.dart';
import 'package:offline_outlet/data/local/dao/outlet_dao.dart';
import 'package:offline_outlet/viewmodels/order/order_cubit.dart';
import 'package:offline_outlet/viewmodels/product/product_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  _registerDataLayer();
}

void _registerDataLayer() {
  getIt
    ..registerLazySingleton<OutletMockApi>(
      OutletMockApi.new,
    )
    ..registerLazySingleton<OutletRepository>(
      () => OutletRepository(getIt()),
    )
    ..registerFactory<OutletCubit>(
      () => OutletCubit(getIt()),
    )
    ..registerLazySingleton<ProductMockApi>(
      ProductMockApi.new,
    )
    ..registerLazySingleton<ProductRepository>(
      () => ProductRepository(getIt()),
    )
    ..registerFactory<ProductCubit>(
        () => ProductCubit(getIt()),
    )
    ..registerLazySingleton<OrderMockApi>(
      OrderMockApi.new,
    )
    ..registerLazySingleton<OrderRepository>(
          () => OrderRepository(getIt()),
    )
    ..registerLazySingleton<AppDatabase>(
        () => AppDatabase(),
    )
    ..registerLazySingleton<OutletDao>(
        () => OutletDao(getIt<AppDatabase>()),
    )
    ..registerFactory<OrderCubit>(
          () => OrderCubit(getIt()),
    );
}
