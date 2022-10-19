import 'package:cater_me_v2/module_orders/ui/widget/order_card.dart';
import 'package:flutter/material.dart';
import '../../../abstracts/states/state.dart';
import '../../response/orders_response.dart';
import '../screens/orders_screen.dart';

class OrdersListSuccess extends States {
  final List<OrdersResponse> ordersList;
  OrdersScreenState screenState;

  OrdersListSuccess({required this.ordersList, required this.screenState});

  @override
  Widget getUI(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) =>  OrderCard(
          model: ordersList[index],
        ),
      itemCount: ordersList.length,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
