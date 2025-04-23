import 'package:dio/dio.dart';
import 'package:ecomerce_app/core/network/remote/dio_helper.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

setupGetIt() {
  getIt.registerLazySingleton<Dio>(() => DioHelper.init);
}
