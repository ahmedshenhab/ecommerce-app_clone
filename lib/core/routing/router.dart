import 'package:ecomerce_app/module/home/home_screen.dart';
import 'package:ecomerce_app/module/details_screen/details_screen.dart';

import 'package:flutter/material.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      //login

      case HomeScreen.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case DetailsScreen.detailScreen:
        return MaterialPageRoute(builder: (_) => DetailsScreen());

      // register

      default:
        return null;
    }
  }
}
