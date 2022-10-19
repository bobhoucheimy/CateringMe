import 'package:cater_me_v2/module_credits/response/credit_response.dart';
import 'package:cater_me_v2/utils/images/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:intl/intl.dart';

class CreditCard extends StatelessWidget {
  final CreditsResponse model;
  final VoidCallback? onDelete;
  final VoidCallback? onSelect;
  final bool isSelectedPage;
  const CreditCard({required this.model, required this.onDelete , required this.onSelect, required this.isSelectedPage});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
            alignment: AlignmentDirectional.centerEnd,
          children:[
            CreditCardWidget(
              cardNumber: '**** **** **** '+'${model.cardNumber}',
              expiryDate:  model.expiryDate?.split('T').first ??'',
              cardHolderName: model.name ?? 'ssssssss',
              cvvCode: '',
              showBackView: false,
              // height: 180,
              // width: 305,
              onCreditCardWidgetChange: (_) {},
              isSwipeGestureEnabled: false,
              obscureCardCvv: true,
              isChipVisible: true,
              isHolderNameVisible: true,
              cardType: CardType.visa,
              cardBgColor: Colors.transparent,
              height: 155,
              // backgroundImage: ImageAsset.LOGO,
              glassmorphismConfig: Glassmorphism(blurX: 5.0, blurY: 10.0, gradient:  LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Colors.green.shade600,
                    Colors.grey.shade900,
                  ],
                  stops: [
                    0.3,0.3
                  ]
              )),
              customCardTypeIcons: [
                CustomCardTypeIcon(cardType: CardType.otherBrand ,cardImage: Icon(Icons.credit_card ,size: 0 , color: Theme.of(context).primaryColor,))
              ],

            ),
            isSelectedPage ?   InkWell(
              onTap: onSelect,
              child: Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 100, 25, 0),
                    child: Icon(
                      model.selected! ?
                      Icons.check_circle_sharp:
                      Icons.circle_outlined ,color: Colors.green,size: 45,),
                  )),
            ) :
            InkWell(
              onTap: onDelete,
              child: Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 100, 25, 0),
                    child: Icon(Icons.delete ,color: Colors.red,size: 45,),
                  )),
            )
          ]
        ),);
  }
}
