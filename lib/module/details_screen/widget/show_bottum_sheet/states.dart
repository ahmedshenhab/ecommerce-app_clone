import 'package:ecomerce_app/module/details_screen/widget/show_bottum_sheet/repo.dart';

sealed   class ShowBottumState {


  
}
class DetailsOrderInitialState extends ShowBottumState {}

 class DetailsOrderLoadingState extends ShowBottumState {}

 class DetailsOrderSuccessState extends ShowBottumState {
  final FinishOrder orderId;
  DetailsOrderSuccessState({required this.orderId});
}

 class DetailsOrderErrorState extends ShowBottumState {
  final String message;
  DetailsOrderErrorState({required this.message});
}
