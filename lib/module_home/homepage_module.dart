import 'package:cater_me_v2/abstracts/module/yes_module.dart';
import 'package:cater_me_v2/module_home/ui/screens/home_page_screen.dart';
import 'package:cater_me_v2/module_home/ui/screens/item_detailes.dart';
import 'package:cater_me_v2/module_home/ui/screens/package_item_list.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'homepage_route.dart';

@injectable
class HomePageModule extends RoutModule {
  final HomePageScreen _homePage;
  final PackagesItemsListScreen _itemsListScreen;
  final ItemDetailsScreen _itemDetailsScreen;
  HomePageModule(this._homePage, this._itemsListScreen, this._itemDetailsScreen) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      HomePageRoutes.homePage: (context) => _homePage,
      HomePageRoutes.itemsList: (context) => _itemsListScreen,
      HomePageRoutes.itemsDetails: (context) => _itemDetailsScreen,
    };
  }
}
