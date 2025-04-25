import 'package:ecomerce_app/module/home/cubit/cubit.dart';
import 'package:ecomerce_app/module/home/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key, required this.scafoldKey});
  final GlobalKey<ScaffoldState> scafoldKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          

          SizedBox(
            width: 250.w,
            height: 60.h,

            child: SvgPicture.asset(
              fit: BoxFit.cover,
              'assets/images/logo.svg',
            ),
          ),
          BlocBuilder<HomeCubit, HomeStates>(
            buildWhen:
                (previous, current) =>
                    current is ProductByCategoryLoadingStates ||
                    current is ProductByCategoryErrorStates ||
                    current is ProductByCategorySuccessStates,
            builder: (context, state) {
              if (state is ProductByCategoryLoadingStates) {
                return SizedBox(
                  width: 25.w,
                  height: 25.h,

                  child: CircularProgressIndicator(color: Colors.black),
                );
              } else if (state is ProductByCategoryErrorStates) {
                return SizedBox.shrink();
              } else if (state is ProductByCategorySuccessStates) {
                return InkWell(
                  onTap: () {
                    // BlocProvider.of<HomeCubit>(
                    //   context,
                    // ).scafoldKey.currentState!.openDrawer();
                    scafoldKey.currentState!.openDrawer();
                  },

                  child: Icon(Icons.menu),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
