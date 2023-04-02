import 'package:catfacts/data/network/app_api.dart';
import 'package:catfacts/domain/repository/repository.dart';
import 'package:catfacts/domain/viewmodel/get/get_cats_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void locator() {
  Dio dio = Dio();
  getIt.registerLazySingleton(() => dio);

  AppServiceClient appServiceClient = AppServiceClient(getIt.call());
  getIt.registerLazySingleton(() => appServiceClient);

  Repository repository = Repository(getIt.call());
  getIt.registerLazySingleton(() => repository);

  GetCatsCubit getCatsCubit = GetCatsCubit(getIt.call());
  getIt.registerLazySingleton(() => getCatsCubit);
}
