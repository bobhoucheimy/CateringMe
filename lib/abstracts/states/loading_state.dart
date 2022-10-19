import 'package:cater_me_v2/abstracts/states/state.dart';
import 'package:cater_me_v2/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingState extends States {
  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: Lottie.asset(LottieAsset.LOADING_CART),
    );
  }
}
