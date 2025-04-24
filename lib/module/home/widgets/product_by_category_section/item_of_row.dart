import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerce_app/core/style/app_color.dart';
import 'package:ecomerce_app/module/home/models/product_by_category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ITEMOFROW extends StatelessWidget {
  const ITEMOFROW({
    super.key,
    required this.categoryData, required this.index,
  });

  final CategoryData categoryData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl:
                      categoryData.products?[index].imageCover ??
                      '',
                  placeholder:
                      (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                  errorWidget:
                      (context, url, error) =>
                          const Icon(Icons.error),
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
            categoryData.products?[index].name ?? '',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(fontSize: 16.sp),
          ),
          SizedBox(height: 15.h),
          Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            "${categoryData.products?[index].price?.toStringAsFixed(0) ?? '0'} ج م",
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
              child: InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceAround,
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
          ),
        ],
      ),
    );
  }
}
