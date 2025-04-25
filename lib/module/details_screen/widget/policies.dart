import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Policies extends StatelessWidget {
  const Policies({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [    Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              ':سياستنا في العمل',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w900,

                                fontSize: 24.sp,
                              ),
                            ),
                          ),

                          SizedBox(height: 40.h),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              ':الدفع والتوصيل',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w900,

                                fontSize: 24.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              textAlign: TextAlign.right,
                              'ببساطه نقوم بايصال المنتج لغايه منزلك ونقوم بدفع الثمن لموظف التوصيل',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w500,

                                fontSize: 22.sp,
                              ),
                            ),
                          ),

                          SizedBox(height: 40.h),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              ':الابدال والاسترجاع',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w900,

                                fontSize: 24.sp,
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              textAlign: TextAlign.right,
                              '  يستبدل المنتج في مده اقصاها اربعة عشر يوما ',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w500,

                                fontSize: 21.sp,
                              ),
                            ),
                          ),

                          SizedBox(height: 30.h),

                          Text(
                            textAlign: TextAlign.right,
                            '  تواصل معنا عبر الواتس',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w500,

                              fontSize: 21.sp,
                            ),
                          ),
                       ],);
  }
}