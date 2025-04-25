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
import 'package:ecomerce_app/module/home/widgets/status.dart';
import 'package:ecomerce_app/module/home/widgets/top_bar.dart';
import 'package:ecomerce_app/module/search_body/search_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String homeScreen = "homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              alignment: Alignment.center,
              title: Text(
                'تأكيد الخروج',
                textAlign: TextAlign.end,
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
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text('لا'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text('نعم'),
                ),
              ],
            );
          },
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    log('build home screen');

    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        drawer: CustomDrawer(),
        key: BlocProvider.of<HomeCubit>(context).scafoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 25.h),
              TopBar(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SearchBody()),
                    );
                  },
                  child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: AppColor.gray.withValues(alpha: 0.13),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Icon(Icons.search, color: AppColor.gray),
                        ),
                        Text(
                          'ابحث عن منتج',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            color: AppColor.gray,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),

              /// Search result display
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 25.h),
                      HomeBanner(),
                      SizedBox(height: 20.h),
                      Status(),
                      SizedBox(height: 20.h),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        height: 300,
                        decoration: BoxDecoration(
                          // ignore: deprecated_member_use
                          color: AppColor.grey.withOpacity(0.13),
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
                            BlocProvider.of<HomeCubit>(
                              context,
                            ).getProductByCategory();
                            return const Center(
                              child: Text('wait to show preparing all '),
                            );
                          }
                        },
                      ),
                      SizedBox(height: 45.h),
                      BlocBuilder<HomeCubit, HomeStates>(
                        buildWhen:
                            (previous, current) =>
                                current is ProductByCategoryLoadingStates ||
                                current is ProductByCategoryErrorStates ||
                                current is ProductByCategorySuccessStates,
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


                            final offer = state.productByCategory[1];
                            return Offers(offer: offer,);
                          }
                         else {
                            
                            return const Center(
                              child: Text('wait to show preparing all '),
                            );
                          }

                          
                        },
                      ),
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
