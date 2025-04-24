import 'package:ecomerce_app/module/details_screen/cubit/details_screen_state.dart';
import 'package:ecomerce_app/module/details_screen/data/repo/repo_details_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Detailsscreencubit extends Cubit<DetailsscreenState> {
  Detailsscreencubit({required this.repoDetailsScreen})
    : super(DetailsScreenInitialState());
  final RepoDetailsScreen repoDetailsScreen;
  int quantity = 1;

  void getProductImage({required int id}) async {
    emit(DetailsImageLoadingState());

    final result = await repoDetailsScreen.getProductImage(id);
    result.fold(
      (l) {
        emit(DetailsImageErrorState(message: l));
      },
      (r) {
        emit(DetailsImageSuccessState(images: r));
      },
    );
  }

  void getProductcolors({required int id}) async {
    emit(DetailsColorLoadingState());

    final result = await repoDetailsScreen.getProductcolors(id);
    result.fold(
      (l) {
        emit(DetailsColorErrorState(message: l));
      },
      (r) {
        emit(DetailsColorSuccessState(colors: r));
      },
    );
  }

  void getSize({required int id}) async {
    emit(DetailsSizeLoadingState());

    final result = await repoDetailsScreen.getSize(id);
    result.fold(
      (l) {
        emit(DetailsSizeErrorState(message: l));
      },
      (r) {
        emit(DetailsSizeSuccessState(sizes: r));
      },
    );
  }

  void changeQuantity(String value) {
    if (value == '-') {
      quantity--;
      emit(DetailsQuantityChangesState(quantity: quantity));
    }
    if (value == '+') {
      quantity++;
      emit(DetailsQuantityChangesState(quantity: quantity));
    }
  }
}
