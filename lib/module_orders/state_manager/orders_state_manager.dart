import 'package:cater_me_v2/abstracts/states/error_state.dart';
import 'package:cater_me_v2/module_orders/repository/orders_repository.dart';
import 'package:cater_me_v2/module_orders/response/orders_response.dart';
import 'package:cater_me_v2/module_orders/ui/screens/orders_detailes_screen.dart';
import 'package:cater_me_v2/module_orders/ui/state/orders_list_success.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../abstracts/states/loading_state.dart';
import '../../abstracts/states/state.dart';
import '../ui/screens/orders_screen.dart';


@injectable
class OrdersCubit extends Cubit<States> {
  final OrdersRepository _ordersRepository;
  OrdersCubit(this._ordersRepository) : super(LoadingState());

  getOrders(OrdersScreenState screenState) {
    emit(LoadingState());
    _ordersRepository.getOrders().then((value) {
      if (value == null) {
        emit(ErrorState(
            errMsg: 'Connection error',
            retry: () {
              getOrders(screenState);
            }));
      } else if (value.code == 200) {
        List<OrdersResponse> occList = [];
        for (var item in value.data.insideData) {
          occList.add(OrdersResponse.fromJson(item));
        }
        emit(OrdersListSuccess(
            screenState: screenState, ordersList: occList));
      } else {
        emit(ErrorState(
            errMsg: value.errorMessage,
            retry: () {
              getOrders(screenState);
            }));
      }
    });
  }

  getOrdersDetails(OrdersDetailsScreenState screenState , String id) {
    emit(LoadingState());
    _ordersRepository.getOrder(id).then((value) {
      if (value == null) {
        emit(ErrorState(
            errMsg: 'Connection error',
            retry: () {
              getOrdersDetails(screenState ,id);
            }));
      } else if (value.code == 200) {

      } else {
        emit(ErrorState(
            errMsg: value.errorMessage,
            retry: () {
              getOrdersDetails(screenState,id);
            }));
      }
    });
  }
}
