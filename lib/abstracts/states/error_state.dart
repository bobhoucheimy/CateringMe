import 'package:cater_me_v2/abstracts/states/state.dart';
import 'package:cater_me_v2/utils/components/custom_loading_button.dart';
import 'package:cater_me_v2/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorState extends States {
  final String errMsg;
  final VoidCallback retry;

  ErrorState({required this.errMsg,required this.retry});

  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(LottieAsset.CONNECTION_ERROR),
          SizedBox(
            height: 10,
          ),
          Text(
            errMsg,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),

          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 50,end: 50),
            child: CustomLoadingButton(bgColor: Theme.of(context).errorColor,buttonTab: retry,loading: false,text: 'Retry',textColor: Colors.white,),
          )
        ],
      ),
    );
  }
}
