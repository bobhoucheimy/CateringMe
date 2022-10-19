import 'package:cater_me_v2/abstracts/module/yes_module.dart';
import 'package:cater_me_v2/module_credits/ui/screens/credits_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'credit_route.dart';

@injectable
class CreditsModule extends RoutModule {
  final CreditScreen _creditScreen;
  CreditsModule(this._creditScreen) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      CreditRoutes.VIEW_CREDITS: (context) => _creditScreen,
    };
  }
}
