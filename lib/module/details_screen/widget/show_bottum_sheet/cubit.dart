import 'package:ecomerce_app/module/details_screen/data/models/order_model.dart';
import 'package:ecomerce_app/module/details_screen/widget/show_bottum_sheet/repo.dart';
import 'package:ecomerce_app/module/details_screen/widget/show_bottum_sheet/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowBottumCubit extends Cubit<ShowBottumState> {
  ShowBottumCubit(this.repoShowBottum) : super((DetailsOrderInitialState()));

  final RepoShowBottum repoShowBottum;

  void makeOrder(OrderModel orderModel) async {
    final result = await repoShowBottum.makeOrder(orderModel);

    result.fold(
      (l) {
        emit(DetailsOrderErrorState(message: l));
      },
      (r) {
        emit(DetailsOrderSuccessState(orderId: r));
      },
    );
  }
}
