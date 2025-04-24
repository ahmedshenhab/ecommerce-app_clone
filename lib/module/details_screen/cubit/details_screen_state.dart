import 'package:ecomerce_app/module/details_screen/data/models/product_color_model.dart';
import 'package:ecomerce_app/module/details_screen/data/models/size_model.dart';

sealed class DetailsscreenState {}

final class DetailsScreenInitialState extends DetailsscreenState {}

final class DetailsImageLoadingState extends DetailsscreenState {}

final class DetailsImageSuccessState extends DetailsscreenState {
  final List<String?> images;
  DetailsImageSuccessState({required this.images});
}

final class DetailsImageErrorState extends DetailsscreenState {
  final String message;
  DetailsImageErrorState({required this.message});
}

final class DetailsColorLoadingState extends DetailsscreenState {}

final class DetailsColorSuccessState extends DetailsscreenState {
  final List<DataColor>?  colors;

  DetailsColorSuccessState({required this.colors});
}

final class DetailsColorErrorState extends DetailsscreenState {
  final String message;
  DetailsColorErrorState({required this.message});
}



final class DetailsSizeLoadingState extends DetailsscreenState {}

final class DetailsSizeSuccessState extends DetailsscreenState {
  final List<DataSize>?  sizes;

  DetailsSizeSuccessState({required this.sizes});
}

final class DetailsSizeErrorState extends DetailsscreenState {
  final String message;
  DetailsSizeErrorState({required this.message});
}

final class DetailsQuantityChangesState extends DetailsscreenState {
  final int quantity;
  DetailsQuantityChangesState({required this.quantity});
}