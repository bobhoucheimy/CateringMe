import 'package:cater_me_v2/abstracts/module/yes_module.dart';
import 'package:cater_me_v2/module_occasions/ui/screens/occasions_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'occasions_route.dart';

@injectable
class OccasionsModule extends RoutModule {
  final OccasionsScreen _occasionsScreen;
  OccasionsModule(this._occasionsScreen) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      OccasionsRoutes.VIEW_OCCASION: (context) => _occasionsScreen,
    };
  }
}
