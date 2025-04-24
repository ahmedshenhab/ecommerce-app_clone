import 'package:ecomerce_app/core/style/app_color.dart';
import 'package:ecomerce_app/module/home/cubit/cubit.dart';
import 'package:ecomerce_app/module/home/widgets/product_by_category_section/category_section.dart';
import 'package:ecomerce_app/module/show_all_product_screen/show_all_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<HomeCubit>(context);
    return SafeArea(
      child: Drawer(
        backgroundColor: AppColor.white,
        child: Column(
          children: [
            Container(
              width: 400.w,
              height: 120.h,
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(color: AppColor.white),
              child: SvgPicture.asset(
                'assets/images/logo.svg',
                fit: BoxFit.fitWidth,
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,

              children: [
                Divider(
                  color: Colors.black.withValues(alpha: 0.5),
                  thickness: 0.3.h,

                  endIndent: 15.w,
                  indent: 15.w,
                  height: 30.h,
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ListView.builder(
                    itemCount: cubit.productByCategory?.length ?? 0,

                    itemBuilder:
                        (context, index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 20.w),
                              child: GestureDetector(
                                onTap: () {
                                  cubit.scafoldKey.currentState!.closeDrawer();
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder:
                                          (context) => ShowAllProductScreen(
                                          name:  cubit.productByCategory?[index].name ?? 'default',
                                          product: cubit.productByCategory?[index].products ?? [],
                                          ),
                                    ),
                                  );
                                },
                                child: Text(
                                  cubit.productByCategory?[index].name ??
                                      'default',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyMedium!.copyWith(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.black.withValues(alpha: 0.5),
                              thickness: 0.5.h,

                              endIndent: 15.w,
                              indent: 15.w,
                              height: 30.h,
                            ),
                          ],
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
