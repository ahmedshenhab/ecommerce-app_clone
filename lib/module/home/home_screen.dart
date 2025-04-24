import 'dart:developer';

import 'package:ecomerce_app/core/style/app_color.dart';
import 'package:ecomerce_app/module/home/cubit/cubit.dart';
import 'package:ecomerce_app/module/home/cubit/states.dart';
import 'package:ecomerce_app/module/home/widgets/almost_done.dart';
import 'package:ecomerce_app/module/home/widgets/drawer.dart';
import 'package:ecomerce_app/module/home/widgets/footer.dart';
import 'package:ecomerce_app/module/home/widgets/home_banner.dart';
import 'package:ecomerce_app/module/home/widgets/product_by_category_section/category_section.dart';
import 'package:ecomerce_app/module/home/widgets/offers.dart';
import 'package:ecomerce_app/module/home/widgets/search_bar.dart';
import 'package:ecomerce_app/module/home/widgets/status.dart';
import 'package:ecomerce_app/module/home/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
  static const String homeScreen = "homeScreen";

  const HomeScreen({super.key});
}

class _HomeScreenState extends State<HomeScreen> {
  String searchText = "";

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              alignment: Alignment.center,
              title: Text(
                textAlign: TextAlign.end,
                'تأكيد الخروج',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontSize: 22.sp),
              ),
              content: Text(
                'هل أنت متأكد من الخروج؟',
                textAlign: TextAlign.end,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontSize: 18.sp),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false); // No
                  },
                  child: Text('لا'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true); // Yes
                  },
                  child: Text('نعم'),
                ),
              ],
            );
          },
        )) ??
        false; // Return false if user cancels
  }

  @override
  Widget build(BuildContext context) {
    log('build home screen');
    return WillPopScope(
      onWillPop: _onWillPop, // Intercept back button press
      child: Scaffold(
        drawer: CustomDrawer(),
        key: BlocProvider.of<HomeCubit>(context).scafoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 25.h),

              // Top bar (fixed)
              TopBar(),

              // Search bar (fixed)
              CUSTOMSearchBar(),
              SizedBox(height: 10.h),

              Divider(color: Colors.black, thickness: 0.5.h),
              // Scrollable content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 25.h),
                      // Banner
                      HomeBanner(),
                      // Category/Stories (Horizontal List)
                      SizedBox(height: 20.h),

                      //STATUS
                      Status(),

                      SizedBox(height: 20.h),

                      // emptycontainer
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        height: 300,
                        decoration: BoxDecoration(
                          color: AppColor.grey.withValues(alpha: 0.13),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),

                      SizedBox(height: 20.h),

                      BlocBuilder<HomeCubit, HomeStates>(
                        builder: (context, state) {
                          if (state is ProductByCategoryLoadingStates) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is ProductByCategoryErrorStates) {
                            return Center(child: Text(state.message));
                          } else if (state is ProductByCategorySuccessStates) {
                            if (state.productByCategory.isEmpty) {
                              return const Center(
                                child: Text('No products found'),
                              );
                            }
                            return Padding(
                              padding: EdgeInsets.only(top: 40.h),
                              child: ListView.builder(
                                itemExtent: 480.h,
                                shrinkWrap: true,
                                itemCount: state.productByCategory.length,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder:
                                    (context, index) => CategorySection(
                                      categoryData:
                                          state.productByCategory[index],
                                    ),
                              ),
                            );
                          } else {
                            return SizedBox.shrink();
                          }
                        },
                      ),

                      //offers
                      SizedBox(height: 45.h),

                      Offers(),

                      SizedBox(height: 70.h),

                      AlmostDone(),
                      SizedBox(height: 70.h),

                      Footer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
