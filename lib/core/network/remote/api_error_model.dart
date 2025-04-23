// ignore_for_file: public_member_api_docs, sort_constructors_first

class ApiErrorModel {
  ApiErrorModel({
     this.message,
     
  });

  final String? message;
  

 

  factory ApiErrorModel.fromJson(Map<String, dynamic> map) {
    return ApiErrorModel(
      message: map['message'] != null ? map['message'] as String : null,
     );
  }


}
