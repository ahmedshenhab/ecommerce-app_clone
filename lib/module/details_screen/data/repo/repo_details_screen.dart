import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecomerce_app/core/network/remote/api_error_handler.dart';
import 'package:ecomerce_app/module/details_screen/data/models/product_color_model.dart';
import 'package:ecomerce_app/module/details_screen/data/models/product_image_model.dart';
import 'package:ecomerce_app/module/details_screen/data/models/size_model.dart';

class RepoDetailsScreen {
  final Dio dio;

  RepoDetailsScreen({required this.dio});

  Future<Either<String, List<String?>>> getProductImage(int id) async {
    try {
      final result = await dio.get(
        'https://clotheshop1.runasp.net/api/Product/$id',
      );

      final images =
          ProductImageModel.fromJson(result.data).data?.images
              ?.where((e) => e.imageUrl != null)
              .map((e) => e.imageUrl)
              .toList() ??
          [];
      return Right(images);
    } catch (e) {
      log('prouctByCategory $e');

      return Left(ApiErrorHandler.handle(e).message!);
    }
  }

  Future<Either<String, List<DataColor>?>> getProductcolors(int id) async {
    try {
      final result = await dio.get(
        'https://clotheshop1.runasp.net/api/Product/colors/$id',
      );

      final colors =
          ProductColorModel.fromJson(
            result.data,
          ).data?.where((e) => e.imageUrl != null || e.id != null).toList();

      log('colors: ${colors?.map((e) => e.imageUrl).toList()}');
      log('colors: ${colors?.map((e) => e.imageUrl).toList()}');

      return Right(colors);
    } catch (e) {
      log('prouctByCategory $e');

      return Left(ApiErrorHandler.handle(e).message!);
    }
  }

  Future<Either<String, List<DataSize>?>> getSize(int id) async {
    try {
      final result = await dio.get(
        'https://clotheshop1.runasp.net/api/Product/sizes/$id',
      );

      final sizes =
          SizeModel.fromJson(
            result.data,
          ).data?.where((e) => e.size != null).toList();

      return Right(sizes);
    } catch (e) {
      log('prouctByCategory $e');
      return Left(ApiErrorHandler.handle(e).message!);
    }
  }

  
}




