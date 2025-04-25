import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecomerce_app/core/network/remote/api_error_handler.dart';
import 'package:ecomerce_app/module/home/data/models/news_model.dart';
import 'package:ecomerce_app/module/home/data/models/product_by_category_model.dart';
import 'package:ecomerce_app/module/home/data/models/search_model.dart';
import 'package:ecomerce_app/module/home/data/models/story_model.dart';

class RepoHome {
  final Dio dio;

  const RepoHome({required this.dio});

  //new

  Future<Either<String, List<String>>> getNews() async {
    try {
      final result = await dio.get('https://clotheshop1.runasp.net/api/News');

      final newsModel = NewsModel.fromJson(result.data);
      final List<String> news =
          newsModel.data == null
              ? []
              : newsModel.data!
                  .where((e) => e.description != null)
                  .map((e) => e.description!)
                  .toList();

      return Right(news);
    } catch (e) {
      final result = ApiErrorHandler.handle(e);

      return Left(result.message!);
    }
  }

  //story
  Future<Either<String, List<String>>> getStory() async {
    try {
      final result = await dio.get('https://clotheshop1.runasp.net/api/Story');

      final StoryModel storyModel = StoryModel.fromJson(result.data);
      final List<String> storyImage =
          storyModel.data == null
              ? []
              : storyModel.data!
                  .where((element) => element.storyUrl != null)
                  .map((e) => e.storyUrl!)
                  .toList();

      return Right(storyImage);

      // return Right(news);
    } catch (e) {
      final result = ApiErrorHandler.handle(e);

      return Left(result.message!);
    }
  }

  Future<Either<String, List<CategoryData>>> getProductByCategory() async {
    try {
      final result = await dio.get(
        'https://clotheshop1.runasp.net/api/Category/products',
      );

      final prouctByCategory =
          ProductByCategoryModel.fromJson(result.data).categoryData ?? [];
      log('prouctByCategory $prouctByCategory');
      log('prouctByCategory ${prouctByCategory.length}');

      return Right(prouctByCategory);
    } catch (e) {
      log('prouctByCategory $e');
      return Left(ApiErrorHandler.handle(e).message!);
    }
  }

  Future<Either<String, List<Items>?>> getSearch(String name)async {
try {
  final result =  await dio.get('https://clotheshop1.runasp.net/api/Product?SearchName=$name');


final search=SearchModel.fromJson(result.data).data?.items;
return Right(search);




} catch (e) {

  log('search error $e');
  return Left(ApiErrorHandler.handle(e).message!);
}  }
}
