import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DescriptionProduct extends StatelessWidget {
  const DescriptionProduct({super.key, required this.description});
  final String description;

  @override
  Widget build(BuildContext context) {
    return   Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              textAlign: TextAlign.right,
                          description,
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w400,

                                fontSize: 22.sp,
                              ),
                            ),
                          )

                       ;

  }
}