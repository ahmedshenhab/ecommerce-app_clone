class ProductColorModel {
  
  List<DataColor>? data;

  ProductColorModel({ this.data});

  ProductColorModel.fromJson(Map<String, dynamic> json) {
    
   
    if (json['data'] != null) {
      data = <DataColor>[];
      json['data'].forEach((v) {
        data!.add(DataColor.fromJson(v));
      });
    }
  }

 
}

class DataColor {
  int? id;
  int? productId;
  String? color;
  String? imageUrl;

  DataColor({this.id, this.productId, this.color, this.imageUrl});

  DataColor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    color = json['color'];
    imageUrl = json['imageUrl'];
  }

 
}
