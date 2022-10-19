import 'package:cater_me_v2/consts/payment_keys.dart';
import 'package:cater_me_v2/generated/l10n.dart';
import 'package:cater_me_v2/module_credits/request/create_credit_request.dart';
import 'package:cater_me_v2/module_credits/response/credit_response.dart';
import 'package:cater_me_v2/utils/components/custom_feild.dart';
import 'package:cater_me_v2/utils/components/custom_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_checkout_payment/flutter_checkout_payment.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:tip_dialog/tip_dialog.dart';

class CreateCreditSheet extends StatefulWidget {
  final Function(CreateCreditRequest) createCredit;
  final CreditsResponse? response;
  const CreateCreditSheet({required this.createCredit, this.response});

  @override
  State<CreateCreditSheet> createState() => _CreateOccasionCardState();
}

class _CreateOccasionCardState extends State<CreateCreditSheet> {
  var cardNameHolder = TextEditingController();
  var tokenController = TextEditingController();

  var cvvController = MaskedTextController(mask: '0000');
  var cardNumber = MaskedTextController(mask: '0000 0000 0000 0000');
  var expiryDate = MaskedTextController(mask: '00/00');

  final GlobalKey<FormState> _addCridtKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      maxChildSize: 0.9,
      builder: (context, scrollController) => Container(
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        child: Stack(
          children: [

            ListView(
              controller: scrollController,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(30))),
                  child: ListTile(
                    title: Text(
                      S.of(context).createCredit,
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    leading: Icon(Icons.credit_card, color: Colors.white),

                  ),
                ),
                Form(
                  key: _addCridtKey,
                  child: Column(
                    children: [
                      CustomFormField(
                        controller: cardNameHolder,
                        hintText: 'holder name',
                        validator: true,
                      ),
                      CustomFormField(
                        controller: cardNumber,
                        hintText: 'Card number',
                        validator: true,
                        numbers: true,
                      ),
                      CustomFormField(
                        controller: expiryDate,
                        hintText: 'MM/YY',
                        validator: true,
                        numbers: true,
                      ),
                      CustomFormField(
                        controller: cvvController,
                        hintText: 'cvv',
                        validator: true,
                        numbers: true,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CustomLoadingButton(
                    bgColor: Theme.of(context).primaryColor,
                    text: S.of(context).createCredit,
                    textColor: Colors.white,
                    loading: false,
                    buttonTab: () async {
                      if (_addCridtKey.currentState!.validate())  {
                       await _generateToken();
                      }
                    },
                  ),
                )
              ],
            ),
            TipDialogContainer(
                duration: const Duration(seconds: 2),
                outsideTouchable: true,
                onOutsideTouch: (Widget tipDialog) {
                  if (tipDialog is TipDialog &&
                      tipDialog.type == TipDialogType.LOADING) {
                    TipDialogHelper.dismiss();
                  }
                }),
          ],
        ),
      ),
    );
  }

  Future<void> _generateToken() async {
    TipDialogHelper.loading("Loading");
   await FlutterCheckoutPayment.init(key: "${KEYS.PRO_KEY}",   environment: Environment.LIVE).then((value)async {
     if(value != null && value){
       try {
         String number = cardNumber.text.replaceAll(" ", "");
         String expiryMonth = expiryDate.text.substring(0, 2);
         String expiryYear = expiryDate.text.substring(3);
         CardTokenisationResponse? response =
             await FlutterCheckoutPayment.generateToken(
             number: number,
             name: cardNameHolder.text,
             expiryMonth: expiryMonth,
             expiryYear: expiryYear,
             cvv: cvvController.text);

         // Hide loading dialog
         // Navigator.pop(context);

         print(response?.token);
         print(response?.name);
         TipDialogHelper.dismiss();
         widget.createCredit(CreateCreditRequest(
             name: cardNameHolder.text, cvv: cvvController.text,
             token: response?.token ??''));
       } catch (err) {
         print(err);
       }
     }
   });


  }
}
