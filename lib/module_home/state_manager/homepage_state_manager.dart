
import 'package:cater_me_v2/abstracts/states/error_state.dart';
import 'package:cater_me_v2/module_credits/credit_route.dart';
import 'package:cater_me_v2/module_home/request/place_order_request.dart';
import 'package:cater_me_v2/module_home/ui/state/loading_home_state.dart';
import 'package:cater_me_v2/module_localization/service/localization_service/localization_service.dart';
import 'package:cater_me_v2/module_payments/payment_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tip_dialog/tip_dialog.dart';
import '../../abstracts/states/loading_state.dart';
import '../../abstracts/states/state.dart';
import '../repository/homepage_repository.dart';
import '../response/homepage_response.dart';
import '../ui/screens/home_page_screen.dart';
import '../ui/state/homepage_sucess.dart';

@injectable
class HomePageCubit extends Cubit<States> {
  final HomePageRepository _homePageRepository;
  final LocalizationService _localizationService;

  HomePageCubit(this._homePageRepository, this._localizationService) : super(LoadingState());

  getHomePage(HomePageScreenState state) {
    emit(LoadingHomePage());
    _homePageRepository.getHomePage().then((value) {
      if (value == null) {
        emit(ErrorState(
            errMsg: 'Connection error',
            retry: () {
              getHomePage(state);
            }));
      } else if (value.code == 200) {
        HomePageResponse homePageModel =
            HomePageResponse.fromJson(value.data.insideData);
        state.orderSettingsModel = homePageModel.orderSettings!;
        emit(
          HomePageSuccess(homepage: homePageModel, homepageState: state),
        );
      }
    });
  }

  placeOrder (PlaceOrderRequest request,HomePageScreenState screenState){
    TipDialogHelper.loading("Loading");
    _homePageRepository.placeOrder(request).then((value) async {
      if(value == null){
        TipDialogHelper.fail("Connection error, try again");
      }else if (value.code == 201){
        TipDialogHelper.dismiss();
        Navigator.pushNamed(screenState.context, PaymentRoutes.PAYMENT_METHOD ,);
      }else {
        TipDialogHelper.dismiss();
        TipDialogHelper.fail(value.errorMessage);
        await new Future.delayed(new Duration(seconds: 5));
        TipDialogHelper.dismiss();
      }
    });
  }


}
