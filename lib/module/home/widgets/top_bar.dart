import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return    Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Badge(
                    padding: EdgeInsets.all(0),
                    alignment: AlignmentDirectional(1.5.w, -2.2.h),
                    // offset: Offset(10.w, -10.h),
                    label: Text(
                      // textAlign: TextAlign.center,
                      '1',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    backgroundColor: Colors.transparent,
                    child: Icon(Icons.add_shopping_cart_sharp),
                  ),

                  SizedBox(
                    width: 250.w,
                    height: 60.h,

                    child: SvgPicture.asset(
                      fit: BoxFit.cover,
                      'assets/images/logo.svg',
                    ),
                  ),
                  InkWell(child: Icon(Icons.menu)),
                ],
              ),
            )

         ;
  }
}