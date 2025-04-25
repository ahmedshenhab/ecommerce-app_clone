import 'package:ecomerce_app/module/details_screen/data/models/product_color_model.dart';
import 'package:ecomerce_app/module/details_screen/data/models/size_model.dart';

sealed class DetailsscreenState {}

 class DetailsScreenInitialState extends DetailsscreenState {}

 class DetailsImageLoadingState extends DetailsscreenState {}

 class DetailsImageSuccessState extends DetailsscreenState {
  final List<String?> images;
  DetailsImageSuccessState({required this.images});
}

 class DetailsImageErrorState extends DetailsscreenState {
  final String message;
  DetailsImageErrorState({required this.message});
}

 class DetailsColorLoadingState extends DetailsscreenState {}

 class DetailsColorSuccessState extends DetailsscreenState {
  final List<DataColor>? colors;

  DetailsColorSuccessState({required this.colors});
}

 class DetailsColorErrorState extends DetailsscreenState {
  final String message;
  DetailsColorErrorState({required this.message});
}

 class DetailsSizeLoadingState extends DetailsscreenState {}

 class DetailsSizeSuccessState extends DetailsscreenState {
  final List<DataSize>? sizes;

  DetailsSizeSuccessState({required this.sizes});
}

 class DetailsSizeErrorState extends DetailsscreenState {
  final String message;
  DetailsSizeErrorState({required this.message});
}

 class DetailsQuantityChangesState extends DetailsscreenState {
  final int quantity;
  DetailsQuantityChangesState({required this.quantity});
}

