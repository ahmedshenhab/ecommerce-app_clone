import 'package:ecomerce_app/module/home/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialStates());
    final scafoldKey = GlobalKey<ScaffoldState>();

}
