import 'package:cater_me_v2/generated/l10n.dart';
import 'package:cater_me_v2/module_addresses/address_route.dart';
import 'package:cater_me_v2/module_auth/service/auth_service/auth_service.dart';
import 'package:cater_me_v2/module_credits/credit_route.dart';
import 'package:cater_me_v2/module_friends/friends_route.dart';
import 'package:cater_me_v2/module_localization/service/localization_service/localization_service.dart';
import 'package:cater_me_v2/module_occasions/occasions_route.dart';
import 'package:cater_me_v2/module_orders/order_route.dart';
import 'package:cater_me_v2/module_payments/payment_route.dart';
import 'package:cater_me_v2/module_profile/profile_route.dart';
import 'package:cater_me_v2/module_settings/ui/widgets/icon_background_card.dart';
import 'package:cater_me_v2/module_settings/ui/widgets/language_sheet.dart';
import 'package:cater_me_v2/module_theme/service/theme_service/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

@injectable
class SettingScreen extends StatefulWidget {
  final AuthService _authService;
  final LocalizationService _localizationService;
  final AppThemeDataService _themeDataService;
  SettingScreen(
      this._authService, this._localizationService, this._themeDataService);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).settings),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        )
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconBackCard(
                          title: S.of(context).notifications,
                          iconData: Icons.notifications_active_outlined,
                          onTapCard: () {}),
                      IconBackCard(
                          title: S.of(context).orders,
                          iconData: FontAwesomeIcons.firstOrder,
                          onTapCard: () {
                            Navigator.pushNamed(context, OrderRoutes.VIEW_ORDERS);
                          }),
                      IconBackCard(
                          title: S.of(context).occasions,
                          iconData: Icons.date_range,
                          onTapCard: () {
                            Navigator.pushNamed(
                                context, OccasionsRoutes.VIEW_OCCASION);
                          }),
                      IconBackCard(
                          title: S.of(context).support,
                          iconData: Icons.support_agent_outlined,
                          onTapCard: () {}),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        )
                      ]),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, ProfileRoutes.editProfile);
                        },
                        child: ListTile(
                          leading: Icon(Icons.person),
                          title: Text(
                            S.of(context).profile,
                          ),
                        ),
                      ),
                      Divider(
                        endIndent: 50,
                        indent: 50,
                        thickness: 1,
                        height: 1,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AddressRoutes.VIEW_ADDRESS , arguments: false);
                        },
                        child: ListTile(
                          leading: Icon(Icons.location_on_outlined),
                          title: Text(
                            S.of(context).address,
                          ),
                        ),
                      ),
                      Divider(
                        endIndent: 50,
                        indent: 50,
                        thickness: 1,
                        height: 1,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, FriendsRoutes.VIEW_Friend);
                        },
                        child: ListTile(
                          leading: Icon(Icons.person_pin_rounded),
                          title: Text(
                            S.of(context).friends,
                          ),
                        ),
                      ),
                      Divider(
                        endIndent: 50,
                        indent: 50,
                        thickness: 1,
                        height: 1,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, CreditRoutes.VIEW_CREDITS);
                        },
                        child: ListTile(
                          leading: Icon(Icons.payment),
                          title: Text(
                            S.of(context).paymentMethod,
                          ),
                        ),
                      ),
                      Divider(
                        endIndent: 50,
                        indent: 50,
                        thickness: 1,
                        height: 1,
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return LanguageSheet(
                                  onLanguageChange: (newLang) {
                                    widget._localizationService
                                        .setLanguage(newLang.toString());
                                  },
                                );
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(15))),
                              isScrollControlled: true,
                              elevation: 5);
                        },
                        child: ListTile(
                            leading: Icon(Icons.language),
                            title: Text(
                              S.of(context).language,
                            ),
                            trailing: Text(Text(Localizations.localeOf(context)
                                        .languageCode) ==
                                    'ar'
                                ? 'العربية'
                                : 'English')),
                      ),
                      Divider(
                        endIndent: 50,
                        indent: 50,
                        thickness: 1,
                        height: 1,
                      ),
                      InkWell(
                        onTap: () {},
                        child: ListTile(
                          leading: Icon(Icons.privacy_tip_rounded),
                          title: Text(
                            S.of(context).terms,
                          ),
                        ),
                      ),
                      Divider(
                        endIndent: 50,
                        indent: 50,
                        thickness: 1,
                        height: 1,
                      ),
                      ListTileSwitch(
                        value: Theme.of(context).brightness == Brightness.dark,
                        leading: Icon(
                          Theme.of(context).brightness == Brightness.dark
                              ? Icons.nightlight_round_rounded
                              : Icons.wb_sunny,
                        ),
                        onChanged: (mode) {
                          widget._themeDataService.switchDarkMode(mode);
                        },
                        visualDensity: VisualDensity.comfortable,
                        switchType: SwitchType.cupertino,
                        switchActiveColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        title: Text(
                          S.of(context).darkMode,
                        ),
                      ),
                      Divider(
                        endIndent: 50,
                        indent: 50,
                        thickness: 1,
                        height: 1,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, PaymentRoutes.PAYMENT_METHOD);
                        },
                        child: ListTile(
                          leading: Icon(Icons.contact_phone),
                          title: Text(
                            S.of(context).contactUs,
                          ),
                        ),
                      ),
                      Divider(
                        endIndent: 50,
                        indent: 50,
                        thickness: 1,
                        height: 1,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          )
                        ]),
                    child: ListTile(
                      title: Text(
                        S.of(context).signOut,
                      ),
                      leading: Icon(
                        Icons.logout,
                        color: Colors.red.shade900,
                      ),
                    )),
              )
            ],
          ),
        ));
  }
}
