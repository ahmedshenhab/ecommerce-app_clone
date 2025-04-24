import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecomerce_app/core/di/di.dart'; // Assuming dependency injection setup
import 'package:ecomerce_app/core/network/local/sql/sqldb.dart'; // Import DatabaseHelper

class NameProduct extends StatefulWidget {
  const NameProduct({super.key, required this.name, required this.productId});

  final String name;
  final int productId; 
  // Passing product ID for database operations

  @override
  State<NameProduct> createState() => _NameProductState();
}

class _NameProductState extends State<NameProduct> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkIfFavorite();
  }

  // Check if the product is in the database (favorite)
  Future<void> _checkIfFavorite() async {
    final db = getIt<DatabaseHelper>();
    final allProducts = await db.getAllProducts();

    for (var product in allProducts) {
      if (product.id == widget.productId) {
        setState(() {
          isFavorite = true; // Product is found, mark as favorite
        });
        break;
      }
    }
  }

  // Toggle favorite status (add/remove from database)
  Future<void> _toggleFavorite() async {
    final db = getIt<DatabaseHelper>();

    if (isFavorite) {
      // Remove from database
      await db.deleteProduct(widget.productId);
    } else {
      // Add to database
      await db.insertProduct(
        Product(
          id: widget.productId,
          name: widget.name,
          price: 0.0, // Default price, can be adjusted if needed
          imageUrl: '', // Default image URL, can be adjusted if needed
        ),
      );
    }

    setState(() {
      isFavorite = !isFavorite; // Toggle the favorite state
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
          onPressed: _toggleFavorite,
        ),
        Text(
          widget.name,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w800,
            fontSize: 22.sp,
          ),
        ),
      ],
    );
  }
}
