class SearchModel {
  int? statusCode;
  String? message;
  Data? data;

  SearchModel({this.statusCode, this.message, this.data});

  SearchModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? pageSize;
  int? count;
  int? pageIndex;
  List<Items>? items;

  Data({this.pageSize, this.count, this.pageIndex, this.items});

  Data.fromJson(Map<String, dynamic> json) {
    pageSize = json['pageSize'];
    count = json['count'];
    pageIndex = json['pageIndex'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }
}

class Items {
  int? id;
  String? name;

  String? description;

  int? subCategoryId;
  double? price;
  int? quantity;

  bool? isPriceSame;
  String? imageCover;
  String? scheduleDate;
  bool? isActive;

  Items({
    this.id,
    this.name,
    this.description,
    this.subCategoryId,
    this.price,
    this.quantity,
    this.isPriceSame,
    this.imageCover,
    this.scheduleDate,
    this.isActive,
  });

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    subCategoryId = json['subCategoryId'];
    price = json['price'];
    quantity = json['quantity'];
    isPriceSame = json['isPriceSame'];
    imageCover = json['imageCover'];
    scheduleDate = json['scheduleDate'];
    isActive = json['isActive'];
  }
}
