import 'dart:async';
import 'package:cater_me_v2/abstracts/module/yes_module.dart';
import 'package:cater_me_v2/di/di_config.dart';
import 'package:cater_me_v2/generated/l10n.dart';
// import 'package:cater_me_v2/global_nav_key.dart';
import 'package:cater_me_v2/hive/hive_init.dart';
import 'package:cater_me_v2/module_addresses/address_module.dart';
import 'package:cater_me_v2/module_auth/authoriazation_module.dart';
import 'package:cater_me_v2/module_credits/credit_module.dart';
import 'package:cater_me_v2/module_friends/friends_module.dart';
import 'package:cater_me_v2/module_home/homepage_module.dart';
import 'package:cater_me_v2/module_localization/service/localization_service/localization_service.dart';
import 'package:cater_me_v2/module_occasions/occasions_module.dart';
import 'package:cater_me_v2/module_orders/order_module.dart';
import 'package:cater_me_v2/module_payments/payment_module.dart';
import 'package:cater_me_v2/module_profile/profile_module.dart';
import 'package:cater_me_v2/module_settings/setting_module.dart';
import 'package:cater_me_v2/module_splash/splash_module.dart';
import 'package:cater_me_v2/module_splash/splash_routes.dart';
import 'package:cater_me_v2/module_theme/service/theme_service/theme_service.dart';
import 'package:cater_me_v2/utils/global/global_state_manager.dart';
import 'package:cater_me_v2/utils/logger/logger.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
//import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:lehttp_overrides/lehttp_overrides.dart';
import 'package:device_info/device_info.dart';
import 'dart:io' as p;
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_analytics/observer.dart';
import 'package:simple_moment/simple_moment.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//  timeago.setLocaleMessages('ar', timeago.ArMessages());
//  timeago.setLocaleMessages('en', timeago.EnMessages());
  if (!kIsWeb) {
    if (p.Platform.isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      if (androidInfo.version.sdkInt < 26) {
        p.HttpOverrides.global = LEHttpOverrides();
      }
    }
  }
  await HiveSetUp.init();
  // await Firebase.initializeApp();
  if (kIsWeb) {
  } else {
    // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    // FlutterError.onError = (FlutterErrorDetails details) {
    //   FirebaseCrashlytics.instance.recordFlutterError(details);
    // };
  }
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) async {
    FlutterError.onError = (FlutterErrorDetails details) async {
      Logger().error('Main', details.toString(), StackTrace.current);
    };
    await runZonedGuarded(() {
      configureDependencies();
      // Your App Here
      runApp(getIt<MyApp>());
    }, (error, stackTrace) {
      new Logger().error(
          'Main', error.toString() + stackTrace.toString(), StackTrace.current);
    });
  });
}

@injectable
class MyApp extends StatefulWidget {
  final AppThemeDataService _themeDataService;
  final LocalizationService _localizationService;
  // final FireNotificationService _fireNotificationService;
//  final LocalNotificationService _localNotificationService;
  final SplashModule _splashModule;
  final AuthorizationModule _authorizationModule;
  // final SettingsModule _settingsModule;
  final HomePageModule _homePageModule;
  final OccasionsModule _occasionsModule;
  final SettingModule _settingModule;
  final FriendsModule _friendsModule;
  final ProfileModule _profileModule;
  final CreditsModule _creditsModule;
  final PaymentModule _paymentModule;
  final AddressModule _addressModule;
  final OrdersModule _ordersModule;

  MyApp(
      this._themeDataService,
      this._localizationService,
      // this._fireNotificationService,
//      this._localNotificationService,
      this._splashModule,
      this._authorizationModule,
//      this._chatModule,
//       this._settingsModule,
      this._homePageModule,
      this._occasionsModule,
      this._settingModule,
      this._friendsModule ,
      this._profileModule,
      this._creditsModule,
      this._paymentModule,
      this._addressModule ,
      this._ordersModule
      );

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  // static FirebaseAnalytics analytics = FirebaseAnalytics();
  // static FirebaseAnalyticsObserver observer =
  //     FirebaseAnalyticsObserver(analytics: analytics);
  late String lang;
  late ThemeData activeTheme;
  bool authorized = false;

  @override
  void initState() {
    super.initState();
    lang = widget._localizationService.getLanguage();
    activeTheme = widget._themeDataService.getActiveTheme();
//    timeago.setDefaultLocale(lang);
//    Moment.setLocaleGlobally(lang == 'en' ? LocaleEn() : LocaleAr());
//     widget._fireNotificationService.init();
//    widget._localNotificationService.init();
    widget._localizationService.localizationStream.listen((event) {
//      timeago.setDefaultLocale(event);
//       Moment.setLocaleGlobally(event == 'en' ? LocaleEn() : LocaleAr());
    print('LLLLAAAANGGhhhOMMMEE' + '${event}');
      lang = event;
      setState(() {});
    });
//    widget._fireNotificationService.onNotificationStream.listen((event) {
//      widget._localNotificationService.showNotification(event);
//    });
//    widget._localNotificationService.onLocalNotificationStream
//        .listen((event) {});
//     getIt<GlobalStateManager>().stateStream.listen((event) {
//       if (mounted) {
//         setState(() {});
//       }
//     });
    widget._themeDataService.darkModeStream.listen((event) {
      activeTheme = event;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return getConfiguredApp(RoutModule.RoutesMap);
  }

  Widget getConfiguredApp(
    Map<String, WidgetBuilder> fullRoutesList,
  ) {
    return MaterialApp(
//      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      // navigatorObservers: <NavigatorObserver>[observer],
      // navigatorKey: GlobalVariable.navState,
      locale: Locale.fromSubtags(
        languageCode: lang,
      ),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: activeTheme,
      supportedLocales: S.delegate.supportedLocales,
      title: 'Cater Me',
      routes: fullRoutesList,
      initialRoute: SplashRoutes.SPLASH_SCREEN,
    );
  }
}
