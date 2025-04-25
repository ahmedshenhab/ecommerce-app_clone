import 'package:ecomerce_app/module/home/cubit/states.dart';
import 'package:ecomerce_app/module/home/data/models/product_by_category_model.dart';
import 'package:ecomerce_app/module/home/data/repo/repo_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this.repoHome) : super(HomeInitialStates());
  // final scafoldKey = GlobalKey<ScaffoldState>();
  final controller = TextEditingController();
  final RepoHome repoHome;
  late List<String> newsTitle;
  late List<String> storyImage;
  List<CategoryData>? productByCategory;
  void clearSearch() {
    emit(SearchSuccess(search: [])); // Clear results
  }

  Future<void> getNews() async {
    emit(NewsLoadingStates());

    final result = await repoHome.getNews();
    result.fold(
      (l) {
        emit(NewsErrorStates(message: l));
      },
      (r) {
        newsTitle = r;
        return emit(NewsSuccessStates(news: r));
      },
    );
  }

  Future<void> getStory() async {
    emit(StoryLoadingStates());

    final result = await repoHome.getStory();
    result.fold(
      (l) {
        emit(StoryErrorStates(message: l));
      },
      (r) {
        return emit(StorySuccessStates(storyImage: r));
      },
    );
  }

  Future<void> getProductByCategory() async {
    emit(ProductByCategoryLoadingStates());

    final result = await repoHome.getProductByCategory();
    result.fold(
      (l) {
        emit(ProductByCategoryErrorStates(message: l));
      },
      (r) {
        productByCategory = r;
        emit(ProductByCategorySuccessStates(productByCategory: r));
      },
    );
  }

  void changeFavorite() {
    emit(FavoriteChanges());
  }

  void getSerch(String name) async {
    final result = await repoHome.getSearch(name);

    result.fold(
      (l) {
        emit(SearchError(message: l));
      },
      (r) {
        emit(SearchSuccess(search: r));
      },
    );
  }

  @override
  Future<void> close() {
    controller.clear();

    controller.dispose();

    return super.close();
  }
}
