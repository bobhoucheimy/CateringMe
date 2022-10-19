import 'package:cater_me_v2/abstracts/module/yes_module.dart';
import 'package:cater_me_v2/module_auth/ui/screen/login_screen/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import 'authorization_routes.dart';

@injectable
class AuthorizationModule extends RoutModule {
  final LoginScreen _loginScreen;


  AuthorizationModule(
      this._loginScreen, ) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      AuthorizationRoutes.LOGIN_SCREEN: (context) => _loginScreen,

    };
  }
}
