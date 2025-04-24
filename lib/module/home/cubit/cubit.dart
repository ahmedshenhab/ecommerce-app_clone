import 'package:ecomerce_app/module/home/cubit/states.dart';
import 'package:ecomerce_app/module/home/repo/repo_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this.repoHome) : super(HomeInitialStates());
  final scafoldKey = GlobalKey<ScaffoldState>();
  final RepoHome repoHome;
  late List<String> newsTitle;
  late List<String> storyImage;

  void getNews() async {
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

  void getStory() async {
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
         emit(ProductByCategorySuccessStates(productByCategory: r));
      },
    );
  }
}
