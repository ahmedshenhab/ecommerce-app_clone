import 'package:dio/dio.dart';
import 'package:ecomerce_app/core/network/remote/dio_helper.dart';
import 'package:ecomerce_app/module/home/repo/repo_home.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

setupGetIt() {
  getIt.registerLazySingleton<Dio>(() => DioHelper.init);
  getIt.registerLazySingleton<RepoHome>(() => RepoHome(dio: getIt<Dio>()));
}
