import 'package:ecomerce_app/core/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData lighTheme = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: AppColor.white),
    // badgeTheme: BadgeThemeData(textColor: Colors.black, largeSize: 100),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: AppColor.grey.withValues(alpha: 0.3),
          width: 1.3.w,
        ),

        padding: EdgeInsets.symmetric(horizontal: 12.w),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.deepOrange,
        foregroundColor: AppColor.white,
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.r),
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom()),

    fontFamily: 'cambria',
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontFamily: 'cambria',
        fontSize: 22.sp,
        height: 1.3,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.deepOrange,
        foregroundColor: AppColor.white,
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.r),
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom()),

    fontFamily: 'cambria',
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontFamily: 'cambria',
        fontSize: 22.sp,
        height: 1.3,
        fontWeight: FontWeight.bold,
        color: AppColor.deepOrange,
      ),
    ),
  );
}
