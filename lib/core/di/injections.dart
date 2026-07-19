import 'package:get_it/get_it.dart';
import 'package:offline_outlet/data/remote/mock/outlet_mock_api.dart';
import 'package:offline_outlet/data/repositories/outlet_repository.dart';
import 'package:offline_outlet/viewmodels/outlet/outlet_cubit.dart';


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
  );
}