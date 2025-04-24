import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerce_app/core/style/app_color.dart';
import 'package:ecomerce_app/module/home/models/product_by_category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, this.product});
  final Products? product;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  // Sample image URLs (you can replace with real product data)
  final List<String> images = [
    'https://assets.turbologo.com/blog/en/2021/09/10094210/product-photo-1.png',
    'https://assets.turbologo.com/blog/en/2021/09/10094841/product-photography-with-white-background-1.png',
  ];
  // This will hold the currently selected image
  late String selectedImage;

  @override
  void initState() {
    super.initState();
    selectedImage = images[0]; // default to first image
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('تفاصيل المنتج')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Main Product Image
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(2.w),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: selectedImage,
                    placeholder:
                        (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                    errorWidget:
                        (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                const SizedBox(height: 12),

                /// Horizontal Thumbnail List
                SizedBox(
                  height: 100.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder:
                        (context, index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedImage = images[index];
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 7.w),
                            child: Container(
                              width: 70.w,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:
                                      selectedImage == images[index]
                                          ? AppColor.blue
                                          : Colors.grey,
                                  width: 3.r,
                                ),
                                borderRadius: BorderRadius.circular(17.r),
                              ),
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: images[index],
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
                        ),
                  ),
                ),

                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.favorite_border, color: Colors.red, size: 30.w),

                    Text(
                      'طقم حافظة طعام',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: 22.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'علبه طعام طازج خاليه من البيوتين',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w400,

                      fontSize: 22.sp,
                    ),
                  ),
                ),

                SizedBox(height: 30.h),
                Text(
                  'السعر : 13299 ج.م',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColor.red,

                    fontSize: 22.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
