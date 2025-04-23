import 'package:ecomerce_app/module/home/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TopBarDetailsScreen extends StatelessWidget {
  const TopBarDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'الالكترونيات',
            style: TextStyle(color: Colors.black, fontSize: 20.sp),
          ),

          SizedBox(
            width: 200.w,
            height: 60.h,

            child: SvgPicture.asset(
              fit: BoxFit.cover,
              'assets/images/logo.svg',
            ),
          ),
          InkWell(
            onTap: () {
              BlocProvider.of<HomeCubit>(
                context,
              ).scafoldKey.currentState!.openDrawer();
            },

            child: Icon(Icons.menu),
          ),
        ],
      ),
    );
  }
}
