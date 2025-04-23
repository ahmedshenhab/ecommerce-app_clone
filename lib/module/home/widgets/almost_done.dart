import 'package:ecomerce_app/core/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlmostDone extends StatelessWidget {
  const AlmostDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          padding: EdgeInsets.only(left: 20.w, right: 16),
          height: 55.h,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColor.gray.withValues(alpha: 0.13),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                style: Theme.of(context).textButtonTheme.style!.copyWith(
                  padding: WidgetStateProperty.all(EdgeInsets.all(0)),

                  iconColor: WidgetStateProperty.all(AppColor.blue),

                  backgroundColor: WidgetStateProperty.all(Colors.transparent),
                ),
                onPressed: () {},
                label: Text(
                  'شاهد الكل',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: AppColor.blue,
                  ),
                ),
                icon: Icon(Icons.arrow_back_ios_new_sharp, size: 16.w),
              ),
              Text(
                'منتجات شارفت علي الانتهاء',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 20.h),
        SizedBox(
          height: 315.h,
          child: Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              scrollDirection: Axis.horizontal,
              itemCount: 11,
              shrinkWrap: true,

              itemBuilder:
                  (context, index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 12.w),
                    padding: EdgeInsets.only(
                      top: 5.h,
                      bottom: 5.h,
                      left: 10.w,
                      right: 10.w,
                    ),

                    width: 220.w,
                    height: 310.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColor.gray.withValues(alpha: 0.13),
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              height: 160.h,
                              width: double.infinity,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Colors.transparent,
                              ),

                              child: Image.network(
                                fit: BoxFit.cover,
                                'https://help.rangeme.com/hc/article_attachments/360006928633/what_makes_a_good_product_image.jpg',
                              ),
                            ),
                            Icon(
                              Icons.favorite_border,
                              color: Colors.red,
                              size: 30.w,
                            ),
                          ],
                        ),

                        SizedBox(height: 15.h),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          'اسم المنتج',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(fontSize: 16.sp),
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          ' سعر المنتج',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(fontSize: 16.sp),
                        ),

                        SizedBox(height: 15.h),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 40.h,
                            decoration: BoxDecoration(
                              color: AppColor.black,
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.add_shopping_cart,
                                  color: Colors.white,
                                  size: 25.w,
                                ),
                                Text(
                                  'اضف الي السله',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyMedium!.copyWith(
                                    fontSize: 16.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
