import 'package:cater_me_v2/abstracts/states/state.dart';
import 'package:cater_me_v2/module_orders/response/order_detailes_response.dart';
import 'package:cater_me_v2/module_orders/ui/screens/orders_detailes_screen.dart';
import 'package:flutter/material.dart';

class OrdersDetailsSuccess extends States {
  final OrderDetailsResponse model;
  OrdersDetailsScreenState screenState;

  OrdersDetailsSuccess({required this.model, required this.screenState});

  @override
  Widget getUI(BuildContext context) {
    return Container(
      child:
      Column(children: [
        Card()
      ]),
    );
  }
}
