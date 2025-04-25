class SizeModel {
  int? statusCode;
  String? message;
  List<DataSize>? data;

  SizeModel({this.statusCode, this.message, this.data});

  SizeModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataSize>[];
      json['data'].forEach((v) {
        data!.add(DataSize.fromJson(v));
      });
    }
  }
}

class DataSize {
  int? id;
  int? productColorId;
  num? price;
  num? quantity;
  String? size;
  num? costPrice;

  DataSize({
    this.id,
    this.productColorId,
    this.price,
    this.quantity,
    this.size,
    this.costPrice,
  });

  DataSize.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productColorId = json['productColorId'];
    price = json['price'];
    quantity = json['quantity'];
    size = json['size'];
    costPrice = json['costPrice'];
  }
}
