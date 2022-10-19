import 'package:cater_me_v2/abstracts/module/yes_module.dart';
import 'package:cater_me_v2/module_payments/ui/screens/payment_method_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'payment_route.dart';

@injectable
class PaymentModule extends RoutModule {
  final PaymentMethodScreen _paymentMethodScreen;
  PaymentModule(this._paymentMethodScreen) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      PaymentRoutes.PAYMENT_METHOD: (context) => _paymentMethodScreen,
    };
  }
}
