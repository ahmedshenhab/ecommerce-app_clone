import 'package:ecomerce_app/core/di/di.dart';
import 'package:ecomerce_app/core/routing/router.dart';
import 'package:ecomerce_app/core/style/app_theme.dart';
import 'package:ecomerce_app/module/home/cubit/cubit.dart';
import 'package:ecomerce_app/module/home/home_screen.dart';
import 'package:ecomerce_app/module/details_screen/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(412, 915),
      builder:
          (_, child) => BlocProvider(
            create: (context) => HomeCubit(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              // darkTheme: AppTheme.darkTheme,
              theme: AppTheme.lighTheme,
              themeMode: ThemeMode.light,
              onGenerateRoute: AppRouter.onGenerateRoute,

              initialRoute: HomeScreen.homeScreen,
            ),
          ),
    );
  }
}
