import 'package:ecomerce_app/module/home/models/product_by_category_model.dart';

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
