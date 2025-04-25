class OrderModel {
  final int cityId;
  final int areaId;
  final String address;
  final List<OrderItem> items;
  final String clientName;
  final String clientPhone;

  OrderModel({
    required this.cityId,
    required this.areaId,
    required this.address,
    required this.items,
    required this.clientName,
    required this.clientPhone,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      cityId: json['cityId'],
      areaId: json['areaId'],
      address: json['address'],
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e))
          .toList(),
      clientName: json['clientName'],
      clientPhone: json['clientPhone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cityId': cityId,
      'areaId': areaId,
      'address': address,
      'items': items.map((e) => e.toJson()).toList(),
      'clientName': clientName,
      'clientPhone': clientPhone,
    };
  }
}

class OrderItem {
  final int productId;
  final String productName;
  final int quantity;
  final int sizeId;
  final String imageUrl;
  final int price;
  final String color;

  OrderItem({
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.sizeId,
    required this.imageUrl,
    required this.price,
    required this.color,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      productId: json['productId'],
      productName: json['productName'],
      quantity: json['quantity'],
      sizeId: json['sizeId'],
      imageUrl: json['imageUrl'],
      price: json['price'],
      color: json['color'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productName': productName,
      'quantity': quantity,
      'sizeId': sizeId,
      'imageUrl': imageUrl,
      'price': price,
      'color': color,
    };
  }
}