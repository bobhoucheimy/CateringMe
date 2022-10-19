import 'package:cater_me_v2/consts/globale_cart.dart';
import 'package:cater_me_v2/di/di_config.dart';
import 'package:cater_me_v2/module_home/response/homepage_response.dart';
import 'package:cater_me_v2/module_home/ui/widget/custom_action_botton.dart';
import 'package:cater_me_v2/module_settings/setting_routes.dart';
import 'package:cater_me_v2/utils/global/global_state_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../../utils/images/images.dart';
import '../../state_manager/homepage_state_manager.dart';
import 'package:tip_dialog/tip_dialog.dart';

@injectable
class HomePageScreen extends StatefulWidget {
  final HomePageCubit cubit;

  const HomePageScreen(
    this.cubit,
  );

  @override
  State<HomePageScreen> createState() => HomePageScreenState();
}

class HomePageScreenState extends State<HomePageScreen> {
  late OrderSettings orderSettingsModel;
  @override
  void initState() {
    super.initState();
    widget.cubit.getHomePage(this);

    getIt<GlobalStateManager>().stateStream.listen((event) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  getHome() {
    widget.cubit.getHomePage(this);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset(
            ImageAsset.LOGO,
            height: 50,
          ),
          centerTitle: true,
          leading: InkWell(
              onTap: () {
                Navigator.pushNamed(context, SettingRoutes.SETTING_SCREEN);
              },
              child: Icon(Icons.person)),
          actions: [
            Icon(
              CupertinoIcons.search,
              size: 35,
            )
          ],
        ),
        body: BlocBuilder<HomePageCubit, States>(
          bloc: widget.cubit,
          builder: (context, state) {
            return Stack(
              children: [
                state.getUI(context),

              ],
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: itemsInCart.isNotEmpty
            ? CustomActionButton(
                orderSettingsModel,
                (request) {
                  widget.cubit.placeOrder(request, this);
                },
              )
            : Container());
  }
}
