class ProductByCategoryModel {
  int? statusCode;
  String? message;
  List<CategoryData>? categoryData;

  ProductByCategoryModel({this.statusCode, this.message, this.categoryData});

  ProductByCategoryModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      categoryData = <CategoryData>[];
      json['data'].forEach((v) {
        categoryData!.add(CategoryData.fromJson(v));
      });
    }
  }
}

class CategoryData {
  String? name;
  List<Products>? products;
  int? id;

  CategoryData({this.name, this.products, this.id});

  CategoryData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    id = json['id'];
  }
}

class Products {
  int? id;
  String? name;
  Null tradeDiscount;
  Null saleDiscount;
  String? description;
  Null categoryName;
  Null subCategoryName;
  int? subCategoryId;
  double? price;
  int? quantity;
  Null color;
  bool? isPriceSame;
  String? imageCover;
  String? scheduleDate;
  bool? isActive;

  Products({
    this.id,
    this.name,
    this.tradeDiscount,
    this.saleDiscount,
    this.description,
    this.categoryName,
    this.subCategoryName,
    this.subCategoryId,
    this.price,
    this.quantity,
    this.color,
    this.isPriceSame,
    this.imageCover,
    this.scheduleDate,
    this.isActive,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tradeDiscount = json['tradeDiscount'];
    saleDiscount = json['saleDiscount'];
    description = json['description'];
    categoryName = json['categoryName'];
    subCategoryName = json['subCategoryName'];
    subCategoryId = json['subCategoryId'];
    price = json['price'];
    quantity = json['quantity'];
    color = json['color'];
    isPriceSame = json['isPriceSame'];
    imageCover = json['imageCover'];
    scheduleDate = json['scheduleDate'];
    isActive = json['isActive'];
  }
}
