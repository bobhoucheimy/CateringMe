import 'package:cater_me_v2/module_auth/authorization_routes.dart';
import 'package:cater_me_v2/module_auth/service/auth_service/auth_service.dart';
import 'package:cater_me_v2/module_home/homepage_route.dart';
import 'package:cater_me_v2/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashScreen extends StatefulWidget {
  final AuthService _authService;
  SplashScreen(this._authService);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((Dura) {
      _getNextRoute().then((route) {
        Navigator.of(context).pushNamedAndRemoveUntil(route, (route) => false);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: Center(
          child: Image.asset(
      LottieAsset.SPLASH_SCREEN,
    ),
        ));
  }

  Future<String> _getNextRoute() async {
    await Future.delayed(Duration(seconds: 6));
    if (widget._authService.isLoggedIn) {
      return HomePageRoutes.homePage;
    } else {
      return AuthorizationRoutes.LOGIN_SCREEN;
    }
  }
}
