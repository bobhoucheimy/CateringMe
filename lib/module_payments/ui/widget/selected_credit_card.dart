import 'package:cater_me_v2/module_credits/response/credit_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class SelectedCreditCard extends StatelessWidget {
  final CreditsResponse model;

  const SelectedCreditCard({
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CreditCardWidget(
        cardNumber: '**** **** **** ' + '${model.cardNumber}',
        expiryDate: model.expiryDate?.split('T').first ?? '',
        cardHolderName: model.name ?? 'ssssssss',
        cvvCode: '',
        showBackView: false,
        // height: 180,
        width: 300,
        onCreditCardWidgetChange: (_) {},
        isSwipeGestureEnabled: false,
        obscureCardCvv: true,
        isChipVisible: true,
        isHolderNameVisible: true,
        cardType: CardType.visa,
        cardBgColor: Colors.transparent,
        // height: 170,
        // backgroundImage: ImageAsset.LOGO,
        glassmorphismConfig: Glassmorphism(
            blurX: 10.0,
            blurY: 10.0,
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Colors.green.shade900,
                  Colors.grey.shade900,
                ],
                tileMode: TileMode.mirror,
                stops: [0.5, 0.0])),
        customCardTypeIcons: [
          CustomCardTypeIcon(
              cardType: CardType.otherBrand,
              cardImage: Icon(
                Icons.credit_card,
                size: 0,
                color: Theme.of(context).primaryColor,
              ))
        ],
      ),
    );
  }
}
