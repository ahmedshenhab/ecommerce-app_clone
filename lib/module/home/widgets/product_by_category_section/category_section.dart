import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerce_app/core/style/app_color.dart';
import 'package:ecomerce_app/module/details_screen.dart';
import 'package:ecomerce_app/module/show_all_product_screen/show_all_product_screen.dart';
import 'package:ecomerce_app/module/home/models/product_by_category_model.dart';
import 'package:ecomerce_app/module/home/widgets/product_by_category_section/item_of_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key, required this.categoryData});
  final CategoryData categoryData;

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
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder:
                          (context) => ShowAllProductScreen(
                            name: categoryData.name ?? 'default',
                            product: categoryData.products ?? [],
                          ),
                    ),
                  );
                },
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
                categoryData.name ?? 'default',
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
          child: ListView.builder(
            padding: EdgeInsets.all(0),
            scrollDirection: Axis.horizontal,
            itemCount: categoryData.products?.length ?? 0,

            itemBuilder:
                (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => DetailsScreen(
                              product: categoryData.products![index],
                            ),
                      ),
                    );
                  },
                  child: ITEMOFROW(categoryData: categoryData, index: index),
                ),
          ),
        ),
      ],
    );
  }
}
