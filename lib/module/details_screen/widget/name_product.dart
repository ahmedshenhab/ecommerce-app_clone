import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecomerce_app/core/di/di.dart'; // Assuming dependency injection setup
import 'package:ecomerce_app/core/network/local/sql/sqldb.dart'; // Import DatabaseHelper

class NameProduct extends StatefulWidget {
  const NameProduct({super.key, required this.name, required this.productId, this.price, this.image});

  final String? name;
  final int? productId;
  final double? price;
  final String? image;
  // Passing product ID for database operations

  @override
  State<NameProduct> createState() => _NameProductState();
}

class _NameProductState extends State<NameProduct> {
  bool isFavorite = false;
  late final Product product;
  @override
  void initState() {
    super.initState();
    product = Product(
      id: widget.productId,
      name: widget.name??'',
      price:
          widget.price?.toDouble() ?? 0.0,
      imageUrl: widget.image ?? '',
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : Colors.grey,
            size: 30.w,
          ),
          onPressed: toggleFavorite,
        ),
        Text(
          widget.name??'',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w800,
            fontSize: 22.sp,
          ),
        ),
      ],
    );
  }
}
