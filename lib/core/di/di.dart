import 'package:dio/dio.dart';
import 'package:ecomerce_app/core/network/local/sql/sqldb.dart';
import 'package:ecomerce_app/core/network/remote/dio_helper.dart';
import 'package:ecomerce_app/module/details_screen/data/repo/repo_details_screen.dart';
import 'package:ecomerce_app/module/details_screen/widget/show_bottum_sheet/repo.dart';
import 'package:ecomerce_app/module/home/data/repo/repo_home.dart';

import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

setupGetIt() {

  getIt.registerLazySingleton<Dio>(() => DioHelper.init);
  getIt.registerLazySingleton<RepoHome>(() => RepoHome(dio: getIt<Dio>()));
  getIt.registerLazySingleton<RepoDetailsScreen>(() =>RepoDetailsScreen (dio: getIt<Dio>()));
  getIt.registerLazySingleton<RepoShowBottum>(() =>RepoShowBottum (dio: getIt<Dio>()));
  final db = DatabaseHelper();
  getIt.registerLazySingleton<DatabaseHelper>(() =>db);

}

  