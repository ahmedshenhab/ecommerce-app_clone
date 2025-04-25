import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecomerce_app/core/network/remote/api_error_handler.dart';
import 'package:ecomerce_app/module/details_screen/data/models/order_model.dart';

class RepoShowBottum {
  final Dio dio;

  RepoShowBottum({required this.dio});

  Future<Either<String, FinishOrder>> makeOrder(OrderModel orderModel) async {
  try {
  final json = orderModel.toJson();
  log('Sending OrderModel: $json');

  final result = await dio.post(
    'https://clotheshop1.runasp.net/api/Order',
    data: json,
  );

  return Right(FinishOrder.fromJson(result.data));
} catch (e) {
  log(' error from RepoShowBottum $e');

  if (e is DioException) {
    log('Response: ${e.response?.data}');
  }

  return Left(ApiErrorHandler.handle(e).message!);
}

  }
}

class FinishOrder {
  int? orderId;

  FinishOrder({this.orderId});

  FinishOrder.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
  }
}
