import 'package:ecomerce_app/module/home/data/models/product_by_category_model.dart';
import 'package:ecomerce_app/module/home/data/models/search_model.dart';

class HomeStates {}

class HomeInitialStates extends HomeStates {}

class NewsLoadingStates extends HomeStates {}

class NewsSuccessStates extends HomeStates {
  final List<String> news;

  NewsSuccessStates({required this.news});
}

class NewsErrorStates extends HomeStates {
  final String message;

  NewsErrorStates({required this.message});
}

class StoryLoadingStates extends HomeStates {}

class StorySuccessStates extends HomeStates {
  final List<String> storyImage;

  StorySuccessStates({required this.storyImage});
}

class StoryErrorStates extends HomeStates {
  final String message;

  StoryErrorStates({required this.message});
}

class ProductByCategoryLoadingStates extends HomeStates {}

class ProductByCategorySuccessStates extends HomeStates {
  final List<CategoryData> productByCategory;

  ProductByCategorySuccessStates({required this.productByCategory});
}

class ProductByCategoryErrorStates extends HomeStates {
  final String message;

  ProductByCategoryErrorStates({required this.message});
}


  final class FavoriteChanges extends HomeStates {}

  final class SearchLoading extends HomeStates {}

  final class SearchSuccess extends HomeStates {

    final List<Items>? search;

    SearchSuccess({required this.search});
  }

  final class SearchError extends HomeStates {

    final String message;

    SearchError({required this.message});

     
  }
