import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerce_app/core/style/app_color.dart';
import 'package:ecomerce_app/module/details_screen/details_screen.dart';
import 'package:ecomerce_app/module/home/data/models/product_by_category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ShowAllProductScreen extends StatelessWidget {
  const ShowAllProductScreen({
    super.key,
    required this.product,
    required this.name,
  });
  static const String showAllProductScreen = '/showAllProductScreen';
  final List<Products>? product;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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

        title: Text(name),

        backgroundColor: Colors.white,
        elevation: 0,
      ),

      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // (),
            SizedBox(height: 10.h),

            SizedBox(height: 20.h),

            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                itemCount: product?.length ?? 0,
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
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => DetailsScreen(
                                        product: product?[index]??Products(),
                                      ),
                                ),
                              );
                            },
                            child: Container(
                              height: 160.h,
                              width: double.infinity,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Colors.transparent,
                              ),

                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: product?[index].imageCover ?? '',
                                placeholder:
                                    (context, url) => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                errorWidget:
                                    (context, url, error) =>
                                        const Icon(Icons.error),
                              ),
                            ),
                          ),

                          SizedBox(height: 15.h),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            product?[index].name ?? 'default',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(fontSize: 16.sp),
                          ),
                          SizedBox(height: 15.h),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            "${product?[index].price ?? '0'} ج.م",
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
