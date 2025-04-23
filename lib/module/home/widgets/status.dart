import 'package:ecomerce_app/core/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Status extends StatelessWidget {
  const Status({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder:
                  (context, index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                    child: CircleAvatar(
                      radius: 32.r,
                      backgroundColor: AppColor.pink,
                      child: CircleAvatar(
                        radius: 30.r,
                        child: Image.asset('assets/images/imageContainer.png'),
                      ),
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
