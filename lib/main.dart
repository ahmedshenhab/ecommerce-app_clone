import 'package:ecomerce_app/core/di/di.dart';
import 'package:ecomerce_app/core/observer/observer.dart';
import 'package:ecomerce_app/core/style/app_theme.dart';
import 'package:ecomerce_app/module/home/cubit/cubit.dart';
import 'package:ecomerce_app/module/home/cubit/states.dart';
import 'package:ecomerce_app/module/home/home_screen.dart';
import 'package:ecomerce_app/module/home/data/repo/repo_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setupGetIt();
  runApp(const AppEntry());
}

class AppEntry extends StatelessWidget {
  const AppEntry({super.key});

  Future<HomeCubit> _initializeCubit() async {
    final cubit = HomeCubit(getIt<RepoHome>());
    cubit.getNews();
    cubit.getStory();
    cubit.getSerch('a');

    Future.delayed(Duration(milliseconds: 300), () async {
      await cubit.getProductByCategory();
    });
    return cubit;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<HomeCubit>(
      future: _initializeCubit(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const MaterialApp(
            home: Scaffold(body: Center(child: CircularProgressIndicator())),
          );
        }

        return BlocProvider<HomeCubit>.value(
          value: snapshot.data!,
          child: const MyApp(),
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 915),
      minTextAdapt: true,
      builder:
          (_, child) => BlocBuilder<HomeCubit, HomeStates>(
            buildWhen: (previous, current) => current is! FavoriteChanges,

            builder:
                (BuildContext context, HomeStates state) => MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  theme: AppTheme.lighTheme,
                  home:  HomeScreen(),
                ),
          ),
    );
  }
}
