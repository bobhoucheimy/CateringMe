import 'package:cater_me_v2/abstracts/module/yes_module.dart';
import 'package:cater_me_v2/module_splash/splash_routes.dart';
import 'package:cater_me_v2/module_splash/ui/screen/splash_screen.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashModule extends RoutModule {
  SplashModule(SplashScreen splashScreen) {
    RoutModule.RoutesMap.addAll(
        {SplashRoutes.SPLASH_SCREEN: (context) => splashScreen});
  }
}
