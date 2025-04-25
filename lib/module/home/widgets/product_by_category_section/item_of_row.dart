import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerce_app/core/di/di.dart';
import 'package:ecomerce_app/core/style/app_color.dart';
import 'package:ecomerce_app/module/home/data/models/product_by_category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecomerce_app/core/network/local/sql/sqldb.dart'; // Make sure this is correct

class ITEMOFROW extends StatefulWidget {
  const ITEMOFROW({super.key, required this.categoryData, required this.index});

  final CategoryData categoryData;
  final int index;

  @override
  State<ITEMOFROW> createState() => _ITEMOFROWState();
}

class _ITEMOFROWState extends State<ITEMOFROW> {
  bool isFavorite = false;
  late final Product product;

  @override
  void initState() {
    super.initState();
    product = Product(
      id: widget.categoryData.products?[widget.index].id ?? 0,
      name: widget.categoryData.products?[widget.index].name ?? '',
      price:
          widget.categoryData.products?[widget.index].price?.toDouble() ?? 0.0,
      imageUrl: widget.categoryData.products?[widget.index].imageCover ?? '',
    );
    checkIfFavorite();
  }

  void checkIfFavorite() async {
    final favorites = await DatabaseHelper().getAllProducts();
    if (!mounted) {
      return; // <- prevent setState if widget is no longer in the tree
    }
    setState(() {
      isFavorite = favorites.any(
        (p) =>
            p.name == product.name &&
            p.price == product.price &&
            p.imageUrl == product.imageUrl,
      );
    });
  }

  void toggleFavorite() async {
    final db = getIt<DatabaseHelper>();
    if (isFavorite) {
      final all = await db.getAllProducts();
      final match = all.firstWhere(
        (p) =>
            p.name == product.name &&
            p.price == product.price &&
            p.imageUrl == product.imageUrl,
      );
      await db.deleteProduct(match.id!);
    } else {
      await db.insertProduct(product);
    }
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      padding: EdgeInsets.only(top: 5.h, bottom: 5.h, left: 10.w, right: 10.w),
      width: 220.w,
      height: 310.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColor.gray.withAlpha(33),
      ),
      child: Column(
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
                ),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: product.imageUrl,
                  placeholder:
                      (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              InkWell(
                onTap: toggleFavorite,
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.grey,
                  size: 30.w,
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          Text(
            product.name,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(fontSize: 16.sp),
          ),
          SizedBox(height: 15.h),
          Text(
            "${product.price.toStringAsFixed(0)} ج م",
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.add_shopping_cart,
                    color: Colors.white,
                    size: 25.w,
                  ),
                  Text(
                    'اضف الي السله',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
  }
}
