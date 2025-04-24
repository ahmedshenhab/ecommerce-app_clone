import 'package:ecomerce_app/core/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceProduct extends StatelessWidget {
  const PriceProduct({super.key, required this.price});
  final String price;

  @override
  Widget build(BuildContext context) {
    return      Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '  السعر : $price ج.م',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColor.red,

                                fontSize: 22.sp,
                              ),
                            ),
                          )

                       

                       ;

  }
}