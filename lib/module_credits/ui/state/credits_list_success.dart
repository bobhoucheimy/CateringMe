import 'package:cater_me_v2/module_credits/response/credit_response.dart';
import 'package:cater_me_v2/module_credits/ui/widget/credit_card.dart';
import 'package:flutter/material.dart';
import '../../../abstracts/states/state.dart';
import '../screens/credits_screen.dart';

class CreditsListSuccess extends States {
  final List<CreditsResponse> creditsList;
  CreditScreenState screenState;

  CreditsListSuccess({required this.creditsList, required this.screenState});

  @override
  Widget getUI(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) =>  CreditCard(
          isSelectedPage: false,
          onSelect: (){},
          model: creditsList[index],
          onDelete: () {
            screenState.deleteCredit(creditsList[index].id.toString());
          },
        ),
      itemCount: creditsList.length,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
