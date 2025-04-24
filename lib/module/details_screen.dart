import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerce_app/core/style/app_color.dart';
import 'package:ecomerce_app/module/home/models/product_by_category_model.dart';
import 'package:ecomerce_app/module/home/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      appBar: AppBar(
        
        primary: true,

        titleSpacing: 25.w,
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        // bottomOpacity: 0,
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
        elevation: 0,
        title: Text('تفاصيل المنتج'),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Main Product Image
              Container(
                width: double.infinity,
                // padding: EdgeInsets.all(2.w),
                margin: EdgeInsets.symmetric(horizontal: 12.w),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: CachedNetworkImage(
                  imageUrl: selectedImage,
                  placeholder:
                      (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
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
                            width: 90.w,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:
                                    selectedImage == images[index]
                                        ? AppColor.blue
                                        : Colors.grey,
                                width: 2.r,
                              ),
                              borderRadius: BorderRadius.circular(17.r),
                            ),

                            child: Container(
                              width: 70.w,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
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
              ),

              SizedBox(height: 15.h),

              /// Product Name
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                          size: 30.w,
                        ),

                        Text(
                          '${widget.product!.name}',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: 22.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),

                    /// Product Description
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        textAlign: TextAlign.right,
                        '${widget.product!.description}',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w400,

                          fontSize: 22.sp,
                        ),
                      ),
                    ),

                    SizedBox(height: 30.h),
                    // Price
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '  السعر : ${widget.product!.price} ج.م',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColor.red,

                          fontSize: 22.sp,
                        ),
                      ),
                    ),

                    SizedBox(height: 30.h),
                    // Color Selection
                    Align(
                      alignment: Alignment.centerRight,

                      child: Text(
                        'يرجي اختيار اللون',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w800,

                          fontSize: 24.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 18.h),

                    SizedBox(
                      height: 90.h,
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
                                  width: 80.w,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color:
                                          selectedImage == images[index]
                                              ? AppColor.blue
                                              : Colors.grey,
                                      width: 2.r,
                                    ),
                                    borderRadius: BorderRadius.circular(17.r),
                                  ),

                                  child: Container(
                                    width: 70.w,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.r),
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
                    ),
                    SizedBox(height: 18.h),

                    //القياس
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'يرجي اختيار القياس',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w800,

                          fontSize: 24.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 18.h),

                    //size
                    SizedBox(
                      height: 40.h,
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        itemCount: images.length,
                        itemBuilder:
                            (context, index) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: 7.w),
                              child: TextButton(
                                onPressed: () {},
                                style: Theme.of(
                                  context,
                                ).textButtonTheme.style!.copyWith(
                                  shadowColor: WidgetStateProperty.all(
                                    Colors.transparent,
                                  ),
                                  overlayColor: WidgetStateProperty.all(
                                    Colors.transparent,
                                  ),
                                  fixedSize: WidgetStateProperty.all(
                                    Size(100.w, 100.h),
                                  ),

                                  elevation: WidgetStateProperty.all(0),
                                  padding: WidgetStateProperty.all(
                                    EdgeInsets.all(0),
                                  ),
                                  shape: WidgetStateProperty.all<
                                    RoundedRectangleBorder
                                  >(
                                    RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: AppColor.blue,
                                        width: 1.4.r,
                                      ),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                  ),
                                  backgroundColor: WidgetStateProperty.all(
                                    Colors.transparent,
                                  ),
                                ),
                                child: Text('50 بوصه'),
                              ),
                            ),
                      ),
                    ),

                    SizedBox(height: 18.h),

                    // quantity
                    Align(
                      alignment: Alignment.centerRight,

                      child: Text(
                        'الكمية',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w800,

                          fontSize: 24.sp,
                        ),
                      ),
                    ),

                    SizedBox(height: 18.h),
                    Row(
                      spacing: 10.w,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,

                          height: 40.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColor.black.withValues(alpha: 0.3),
                              width: 1.r,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () {},
                                icon: Icon(Icons.remove, size: 24.sp),
                              ),
                              IconButton(
                                padding: EdgeInsets.all(0),

                                onPressed: () {},
                                icon: Icon(Icons.add, size: 24.sp),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          height: 40.h,
                          // width: ,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColor.black.withValues(alpha: 0.3),
                              width: 1.r,
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Text('1'),
                        ),
                      ],
                    ),

                    SizedBox(height: 25.h),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 45.h,

                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColor.black.withValues(alpha: 0.3),
                          ),
                          color: AppColor.gray.withValues(alpha: 0.18),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.add_shopping_cart_rounded, size: 25.w),
                            Text(
                              'اضف الي السله',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium!.copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 30.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        ':سياستنا في العمل',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w500,

                          fontSize: 21.sp,
                        ),
                      ),
                    ),

                    SizedBox(height: 30.h),

                    Text(
                      textAlign: TextAlign.right,
                      '  تواصل معنا عبر الواتس',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,

                        fontSize: 21.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),

              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
