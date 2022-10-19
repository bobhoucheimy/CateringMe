// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../http_client/http_client.dart' as _i9;
import '../main.dart' as _i55;
import '../module_addresses/address_module.dart' as _i54;
import '../module_addresses/repository/address_repository.dart' as _i23;
import '../module_addresses/state_manager/address_state_manager.dart' as _i43;
import '../module_addresses/ui/screens/address_screen.dart' as _i44;
import '../module_auth/authoriazation_module.dart' as _i45;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i3;
import '../module_auth/repository/auth/auth_repository.dart' as _i11;
import '../module_auth/service/auth_service/auth_service.dart' as _i12;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i16;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i30;
import '../module_credits/credit_module.dart' as _i47;
import '../module_credits/repository/credits_repository.dart' as _i13;
import '../module_credits/state_manager/credits_state_manager.dart' as _i24;
import '../module_credits/ui/screens/credits_screen.dart' as _i46;
import '../module_friends/friends_module.dart' as _i49;
import '../module_friends/repository/friends_repository.dart' as _i14;
import '../module_friends/state_manager/friends_state_manager.dart' as _i25;
import '../module_friends/ui/screens/friends_screen.dart' as _i26;
import '../module_home/homepage_module.dart' as _i50;
import '../module_home/repository/homepage_repository.dart' as _i15;
import '../module_home/state_manager/homepage_state_manager.dart' as _i27;
import '../module_home/ui/screens/home_page_screen.dart' as _i28;
import '../module_home/ui/screens/item_detailes.dart' as _i29;
import '../module_home/ui/screens/package_item_list.dart' as _i36;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i5;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i6;
import '../module_occasions/occasions_module.dart' as _i51;
import '../module_occasions/repository/occasions_repository.dart' as _i17;
import '../module_occasions/state_manager/occasions_state_manager.dart' as _i31;
import '../module_occasions/ui/screens/occasions_screen.dart' as _i32;
import '../module_orders/order_module.dart' as _i52;
import '../module_orders/repository/orders_repository.dart' as _i18;
import '../module_orders/state_manager/orders_state_manager.dart' as _i33;
import '../module_orders/ui/screens/orders_detailes_screen.dart' as _i34;
import '../module_orders/ui/screens/orders_screen.dart' as _i35;
import '../module_payments/payment_module.dart' as _i39;
import '../module_payments/repository/payment_repository.dart' as _i19;
import '../module_payments/state_manager/payment_state_manager.dart' as _i37;
import '../module_payments/ui/screens/payment_method_screen.dart' as _i38;
import '../module_profile/profile_module.dart' as _i53;
import '../module_profile/repository/profile_repository.dart' as _i20;
import '../module_profile/state_manager/profile_state_manager.dart' as _i40;
import '../module_profile/ui/screen/edit_profile_screen.dart' as _i48;
import '../module_settings/setting_module.dart' as _i41;
import '../module_settings/ui/screen/setting_screen.dart' as _i21;
import '../module_splash/splash_module.dart' as _i42;
import '../module_splash/ui/screen/splash_screen.dart' as _i22;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i8;
import '../module_theme/service/theme_service/theme_service.dart' as _i10;
import '../utils/global/global_state_manager.dart' as _i4;
import '../utils/logger/logger.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.AuthPrefsHelper>(() => _i3.AuthPrefsHelper());
  gh.singleton<_i4.GlobalStateManager>(_i4.GlobalStateManager());
  gh.factory<_i5.LocalizationPreferencesHelper>(
      () => _i5.LocalizationPreferencesHelper());
  gh.factory<_i6.LocalizationService>(
      () => _i6.LocalizationService(get<_i5.LocalizationPreferencesHelper>()));
  gh.factory<_i7.Logger>(() => _i7.Logger());
  gh.factory<_i8.ThemePreferencesHelper>(() => _i8.ThemePreferencesHelper());
  gh.factory<_i9.ApiClient>(() => _i9.ApiClient(get<_i7.Logger>()));
  gh.factory<_i10.AppThemeDataService>(
      () => _i10.AppThemeDataService(get<_i8.ThemePreferencesHelper>()));
  gh.factory<_i11.AuthRepository>(() => _i11.AuthRepository(
        get<_i9.ApiClient>(),
        get<_i7.Logger>(),
      ));
  gh.factory<_i12.AuthService>(() => _i12.AuthService(
        get<_i3.AuthPrefsHelper>(),
        get<_i11.AuthRepository>(),
      ));
  gh.factory<_i13.CreditsRepository>(() => _i13.CreditsRepository(
        get<_i9.ApiClient>(),
        get<_i12.AuthService>(),
      ));
  gh.factory<_i14.FriendsRepository>(() => _i14.FriendsRepository(
        get<_i9.ApiClient>(),
        get<_i12.AuthService>(),
      ));
  gh.factory<_i15.HomePageRepository>(() => _i15.HomePageRepository(
        get<_i9.ApiClient>(),
        get<_i12.AuthService>(),
      ));
  gh.factory<_i16.LoginStateManager>(
      () => _i16.LoginStateManager(get<_i12.AuthService>()));
  gh.factory<_i17.OccasionsRepository>(() => _i17.OccasionsRepository(
        get<_i9.ApiClient>(),
        get<_i12.AuthService>(),
      ));
  gh.factory<_i18.OrdersRepository>(() => _i18.OrdersRepository(
        get<_i9.ApiClient>(),
        get<_i12.AuthService>(),
      ));
  gh.factory<_i19.PaymentRepository>(() => _i19.PaymentRepository(
        get<_i9.ApiClient>(),
        get<_i12.AuthService>(),
      ));
  gh.factory<_i20.ProfileRepository>(() => _i20.ProfileRepository(
        get<_i9.ApiClient>(),
        get<_i12.AuthService>(),
      ));
  gh.factory<_i21.SettingScreen>(() => _i21.SettingScreen(
        get<_i12.AuthService>(),
        get<_i6.LocalizationService>(),
        get<_i10.AppThemeDataService>(),
      ));
  gh.factory<_i22.SplashScreen>(
      () => _i22.SplashScreen(get<_i12.AuthService>()));
  gh.factory<_i23.AddressRepository>(() => _i23.AddressRepository(
        get<_i9.ApiClient>(),
        get<_i12.AuthService>(),
      ));
  gh.factory<_i24.CreditsCubit>(
      () => _i24.CreditsCubit(get<_i13.CreditsRepository>()));
  gh.factory<_i25.FriendsCubit>(
      () => _i25.FriendsCubit(get<_i14.FriendsRepository>()));
  gh.factory<_i26.FriendsScreen>(
      () => _i26.FriendsScreen(get<_i25.FriendsCubit>()));
  gh.factory<_i27.HomePageCubit>(() => _i27.HomePageCubit(
        get<_i15.HomePageRepository>(),
        get<_i6.LocalizationService>(),
      ));
  gh.factory<_i28.HomePageScreen>(
      () => _i28.HomePageScreen(get<_i27.HomePageCubit>()));
  gh.factory<_i29.ItemDetailsScreen>(() => _i29.ItemDetailsScreen(
        get<_i27.HomePageCubit>(),
        get<_i12.AuthService>(),
      ));
  gh.factory<_i30.LoginScreen>(
      () => _i30.LoginScreen(get<_i16.LoginStateManager>()));
  gh.factory<_i31.OccasionsCubit>(
      () => _i31.OccasionsCubit(get<_i17.OccasionsRepository>()));
  gh.factory<_i32.OccasionsScreen>(
      () => _i32.OccasionsScreen(get<_i31.OccasionsCubit>()));
  gh.factory<_i33.OrdersCubit>(
      () => _i33.OrdersCubit(get<_i18.OrdersRepository>()));
  gh.factory<_i34.OrdersDetailsScreen>(
      () => _i34.OrdersDetailsScreen(get<_i33.OrdersCubit>()));
  gh.factory<_i35.OrdersScreen>(
      () => _i35.OrdersScreen(get<_i33.OrdersCubit>()));
  gh.factory<_i36.PackagesItemsListScreen>(() => _i36.PackagesItemsListScreen(
        get<_i27.HomePageCubit>(),
        get<_i12.AuthService>(),
      ));
  gh.factory<_i37.PaymentCubit>(() => _i37.PaymentCubit(
        get<_i19.PaymentRepository>(),
        get<_i13.CreditsRepository>(),
      ));
  gh.factory<_i38.PaymentMethodScreen>(
      () => _i38.PaymentMethodScreen(get<_i37.PaymentCubit>()));
  gh.factory<_i39.PaymentModule>(
      () => _i39.PaymentModule(get<_i38.PaymentMethodScreen>()));
  gh.factory<_i40.ProfileCubit>(
      () => _i40.ProfileCubit(get<_i20.ProfileRepository>()));
  gh.factory<_i41.SettingModule>(
      () => _i41.SettingModule(get<_i21.SettingScreen>()));
  gh.factory<_i42.SplashModule>(
      () => _i42.SplashModule(get<_i22.SplashScreen>()));
  gh.factory<_i43.AddressCubit>(
      () => _i43.AddressCubit(get<_i23.AddressRepository>()));
  gh.factory<_i44.AddressScreen>(
      () => _i44.AddressScreen(get<_i43.AddressCubit>()));
  gh.factory<_i45.AuthorizationModule>(
      () => _i45.AuthorizationModule(get<_i30.LoginScreen>()));
  gh.factory<_i46.CreditScreen>(
      () => _i46.CreditScreen(get<_i24.CreditsCubit>()));
  gh.factory<_i47.CreditsModule>(
      () => _i47.CreditsModule(get<_i46.CreditScreen>()));
  gh.factory<_i48.EditProfileScreen>(
      () => _i48.EditProfileScreen(get<_i40.ProfileCubit>()));
  gh.factory<_i49.FriendsModule>(
      () => _i49.FriendsModule(get<_i26.FriendsScreen>()));
  gh.factory<_i50.HomePageModule>(() => _i50.HomePageModule(
        get<_i28.HomePageScreen>(),
        get<_i36.PackagesItemsListScreen>(),
        get<_i29.ItemDetailsScreen>(),
      ));
  gh.factory<_i51.OccasionsModule>(
      () => _i51.OccasionsModule(get<_i32.OccasionsScreen>()));
  gh.factory<_i52.OrdersModule>(() => _i52.OrdersModule(
        get<_i35.OrdersScreen>(),
        get<_i34.OrdersDetailsScreen>(),
      ));
  gh.factory<_i53.ProfileModule>(
      () => _i53.ProfileModule(get<_i48.EditProfileScreen>()));
  gh.factory<_i54.AddressModule>(
      () => _i54.AddressModule(get<_i44.AddressScreen>()));
  gh.factory<_i55.MyApp>(() => _i55.MyApp(
        get<_i10.AppThemeDataService>(),
        get<_i6.LocalizationService>(),
        get<_i42.SplashModule>(),
        get<_i45.AuthorizationModule>(),
        get<_i50.HomePageModule>(),
        get<_i51.OccasionsModule>(),
        get<_i41.SettingModule>(),
        get<_i49.FriendsModule>(),
        get<_i53.ProfileModule>(),
        get<_i47.CreditsModule>(),
        get<_i39.PaymentModule>(),
        get<_i54.AddressModule>(),
        get<_i52.OrdersModule>(),
      ));
  return get;
}
