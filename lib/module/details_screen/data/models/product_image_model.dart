class ProductImageModel {
  int? statusCode;
  String? message;
  Data? data;

  ProductImageModel({this.statusCode, this.message, this.data});

  ProductImageModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

 
}

class Data {
  List<Images>? images;
 
 
 
  Data(
      {this.images,
     });

  Data.fromJson(Map<String, dynamic> json) {
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    }

 
}

class Images {
  int? id;
  int? productId;
  String? attachmentType;
  String? imageUrl;

  Images({this.id, this.productId, this.attachmentType, this.imageUrl});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    attachmentType = json['attachmentType'];
    imageUrl = json['imageUrl'];
  }

  
}
