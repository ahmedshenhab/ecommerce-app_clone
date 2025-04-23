import 'package:ecomerce_app/core/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
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
                Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'المفضلة',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'الكل',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black.withValues(alpha: 0.5),
                  thickness: 0.3.h,
                  endIndent: 15.w,
                  indent: 15.w,
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'المطبخ',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'الالكترونيات',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
          ],
        ),
      ),
    );
  }
}
