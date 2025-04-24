class NewsModel {
  int? statusCode;
  String? message;
  List<Data>? data;

  NewsModel({this.statusCode, this.message, this.data});

  NewsModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
  
}

class Data {
  int? id;
  String? description;

  Data({this.id, this.description});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
  }
}
