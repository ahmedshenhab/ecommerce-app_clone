import 'package:ecomerce_app/core/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350.h,

      decoration: BoxDecoration(color: AppColor.black),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 70.h,
            width: 250.h,
            child: SvgPicture.asset(
              'assets/images/logo.svg',
              colorFilter: ColorFilter.mode(
                AppColor.gray.withValues(alpha: 0.7),
                BlendMode.srcIn,
              ),
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: 40.h),
          Text(
            'تواصلوا معنا عبر',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 25.sp,
              color: AppColor.white,
            ),
          ),
          SizedBox(height: 10.h),

          Row(
            spacing: 30.w,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 15.r,
                backgroundColor: AppColor.white.withValues(alpha: 0.16),

                child: SvgPicture.asset(
                  colorFilter: ColorFilter.mode(
                    AppColor.white.withValues(alpha: 0.8),
                    BlendMode.srcIn,
                  ),
                  'assets/images/whatsapp.svg',
                ),
              ),
              CircleAvatar(
                radius: 15.r,
                backgroundColor: AppColor.white.withValues(alpha: 0.16),

                child: SvgPicture.asset(
                  width: 25.w,
                  height: 23.h,
                  colorFilter: ColorFilter.mode(
                    AppColor.white.withValues(alpha: 0.8),
                    BlendMode.srcIn,
                  ),
                  'assets/images/facebook.svg',
                ),
              ),
            ],
          ),

          SizedBox(height: 40.h),
          Text(
            ':موقعنا',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontStyle: FontStyle.italic,

              fontWeight: FontWeight.bold,
              fontSize: 22.sp,
              color: AppColor.white,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            'الغربيه-طنطا',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontStyle: FontStyle.italic,

              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: AppColor.white.withValues(alpha: 0.6),
            ),
          ),

          Divider(
            color: Colors.white.withValues(alpha: 0.5),
            thickness: 0.5.h,
            endIndent: 30.w,
            indent: 30.w,
          ),

          Text(
            'جميع الحقوق محفوظة © 2024',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontStyle: FontStyle.italic,

              fontWeight: FontWeight.bold,
              fontSize: 16.6.sp,
              color: AppColor.white.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }
}
