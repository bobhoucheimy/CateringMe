import 'package:cater_me_v2/module_credits/response/credit_response.dart';
import 'package:cater_me_v2/module_credits/ui/widget/credit_card.dart';
import 'package:cater_me_v2/module_payments/ui/screens/payment_method_screen.dart';
import 'package:flutter/material.dart';
import '../../../abstracts/states/state.dart';

class SelectedCreditsListSuccess extends States {
  final List<CreditsResponse> creditsList;

  PaymentMethodScreenState screenState;

  SelectedCreditsListSuccess(
      {required this.creditsList, required this.screenState});
  CreditsResponse? _selectedCard;
  @override
  Widget getUI(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) => CreditCard(
          onSelect: () {
            creditsList.forEach((element) {
              element.selected = false;
            });
            creditsList[index].selected = true;
            _selectedCard = creditsList[index];
            screenState.refresh();
          },
          isSelectedPage: true,
          model: creditsList[index],
          onDelete: () {},
        ),
        itemCount: creditsList.length,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
      ),
      floatingActionButton: _selectedCard != null
          ? Padding(
        padding: const EdgeInsets.all(15.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            onPressed: () {
              // Navigator.pop(context,_selectedCard);
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.payment),
                  SizedBox(width: 10,),
                  Text('Pay now' , style: TextStyle(fontSize: 18 , color: Colors.white , fontWeight: FontWeight.bold),),
                ],
              ),
            )),
      )
          : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
