class StoryModel {
  int? statusCode;
  String? message;
  List<Data>? data;

  StoryModel({this.statusCode, this.message, this.data});

  StoryModel.fromJson(Map<String, dynamic> json) {
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
  String? storyUrl;

  Data({this.id, this.storyUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storyUrl = json['storyUrl'];
  }
}
