import 'package:cater_me_v2/abstracts/module/yes_module.dart';
import 'package:cater_me_v2/module_orders/ui/screens/orders_detailes_screen.dart';
import 'package:cater_me_v2/module_orders/ui/screens/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'order_route.dart';

@injectable
class OrdersModule extends RoutModule {
  final OrdersScreen _ordersScreen;
  final OrdersDetailsScreen _ordersDetailsScreen;
  OrdersModule(this._ordersScreen, this._ordersDetailsScreen) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      OrderRoutes.VIEW_ORDERS: (context) => _ordersScreen,
      OrderRoutes.ORDER_DETAILS: (context) => _ordersDetailsScreen,
    };
  }
}
