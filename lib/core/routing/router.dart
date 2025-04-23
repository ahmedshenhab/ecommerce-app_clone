import 'package:ecomerce_app/module/home/cubit/cubit.dart';
import 'package:ecomerce_app/module/home/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      //login

      case HomeScreen.homeScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider<HomeCubit>(
                create: (context) => HomeCubit(),
                child:  HomeScreen(),
              ),
        );

      // register

      default:
        return null;
    }
  }
}
