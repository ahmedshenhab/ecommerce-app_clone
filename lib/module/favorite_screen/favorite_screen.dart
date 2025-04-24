import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerce_app/core/di/di.dart';
import 'package:ecomerce_app/core/network/local/sql/sqldb.dart';
import 'package:ecomerce_app/core/style/app_color.dart';
import 'package:ecomerce_app/module/details_screen/details_screen.dart';
import 'package:ecomerce_app/module/home/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Product> favoriteItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchFavorites();
  }

  void fetchFavorites() async {
    final db = getIt<DatabaseHelper>();
    final data =
        await db
            .getAllProducts(); // Ensure you have this method in DatabaseHelper
    
      favoriteItems = data;

      isLoading = false;
    // ignore: use_build_context_synchronously
    BlocProvider.of<HomeCubit>(context).changeFavorite();
  }

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
        title: Text(''),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              height: 55.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColor.gray.withAlpha(33),
              ),
              child: Row(
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
                ],
              ),
            ),
            SizedBox(height: 20.h),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    itemCount: favoriteItems.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.7.h,
                      crossAxisSpacing: 10.h,
                      crossAxisCount: 2,
                      mainAxisExtent: 330.h,
                      mainAxisSpacing: 15.w,
                    ),
                    itemBuilder: (context, index) {
                      final item = favoriteItems[index];
                      return Container(
                        padding: EdgeInsets.only(
                          top: 5.h,
                          left: 10.w,
                          right: 10.w,
                        ),
                        width: 220.w,
                        height: 310.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: AppColor.gray.withAlpha(33),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Stack(
                              alignment: Alignment.topRight,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => DetailsScreen(
                                              // Pass item if needed
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
                                    ),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl: item.imageUrl,
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
                                InkWell(
                                  onTap: () async {
                                    //         remove from database

                                    log('item.id: ${item.id}');
                                    final db = DatabaseHelper();
                                    await db.deleteProduct(
                                      item.id!,
                                    ); // This is asynchronous
                                    fetchFavorites(); // This should be called after deletion is complete

                                    // ignore: use_build_context_synchronously
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          '${item.name} تمت إزالته من المفضلة',
                                        ),
                                      ),
                                    );
                                  },
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 30.w,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15.h),
                            Text(
                              item.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium!.copyWith(fontSize: 16.sp),
                            ),
                            SizedBox(height: 15.h),
                            Text(
                              '${item.price} ج.م',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium!.copyWith(fontSize: 16.sp),
                            ),
                            SizedBox(height: 15.h),
                            InkWell(
                              onTap: () {
                                // Add to cart logic
                              },
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
                      );
                    },
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
