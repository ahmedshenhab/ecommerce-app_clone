  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// ignore: non_constant_identifier_names
AppBar detail_appBar(BuildContext context) {
    return AppBar(
          primary: true,

          titleSpacing: 25.w,
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          // bottomOpacity: 0,
          actions: [
            SizedBox(
              width: 200.w,
              height: 300.h,

              child: SvgPicture.asset(
                'assets/images/logo.svg',
                fit: BoxFit.cover,
              ),
            ),
          ],
          elevation: 0,
          title: Text('تفاصيل المنتج'),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        );
  }
