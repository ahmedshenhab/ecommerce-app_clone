import 'package:ecomerce_app/core/style/app_color.dart';
import 'package:ecomerce_app/module/details_screen/widgets/top_bar_details_screen.dart';
import 'package:ecomerce_app/module/home/cubit/cubit.dart';
import 'package:ecomerce_app/module/home/widgets/drawer.dart';
import 'package:ecomerce_app/module/home/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});
  static const String detailScreen = '/details-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الالكترونيات'),

        backgroundColor: Colors.white,
        elevation: 0,
      ),
      key: BlocProvider.of<HomeCubit>(context).scafoldKey,
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // (),


            SizedBox(height: 10.h),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              height: 55.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColor.gray.withValues(alpha: 0.13),
              ),
              child: Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 7.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: AppColor.gray, width: 0.5.w),
                      color: Colors.white,
                    ),
                    child: Text(
                      'اجهزه صوتيه',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 12.sp,
                        color: Colors.blue,
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 7.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: AppColor.gray, width: 0.5.w),
                      color: Colors.white,
                    ),
                    child: Text(
                      'التليفزيونات والاكسسوارات',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 13.sp,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.7.h,
                  crossAxisSpacing: 10.h,
                  crossAxisCount: 2,
                  mainAxisExtent: 330.h,
                  mainAxisSpacing: 15.w,
                ),
                itemBuilder:
                    (context, index) => Container(
                      padding: EdgeInsets.only(
                        top: 5.h,

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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.add_shopping_cart,
                                    color: Colors.white,
                                    size: 25.w,
                                  ),
                                  Text(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
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
          ],
        ),
      ),
    );
  }
}
