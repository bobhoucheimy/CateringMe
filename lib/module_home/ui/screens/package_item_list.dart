import 'package:cater_me_v2/module_auth/service/auth_service/auth_service.dart';
import 'package:cater_me_v2/module_home/response/homepage_response.dart';
import 'package:cater_me_v2/module_home/state_manager/homepage_state_manager.dart';
import 'package:cater_me_v2/module_home/ui/widget/item_card.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class PackagesItemsListScreen extends StatefulWidget {
  final HomePageCubit cubit;
  final AuthService _authService;
  const PackagesItemsListScreen(
    this.cubit,
    this._authService,
  );

  @override
  State<PackagesItemsListScreen> createState() => PackagesItemsListState();
}

class PackagesItemsListState extends State<PackagesItemsListScreen> {
  Packages? packages;
  bool flags = true;
  bool isArabic = false;

  @override
  void initState() {
    super.initState();


  }

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    if (args != null && flags) {
      packages = args as Packages;
      flags = false;
      isArabic =  Localizations.localeOf(context).languageCode == 'ar'  ? true : false;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(
          isArabic ? packages?.nameAr ??'' :  packages?.name ?? '',
          ),
        ),
        body: GridView.count(
           children: packages!.items!.map((e) => ItemCard(model: e,width: double.maxFinite,)).toList(),
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          crossAxisCount: 2,
        ));
  }
}
