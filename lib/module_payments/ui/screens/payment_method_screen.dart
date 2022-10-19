import 'package:cater_me_v2/module_credits/request/create_credit_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tip_dialog/tip_dialog.dart';
import '../../../abstracts/states/state.dart';
import '../../state_manager/payment_state_manager.dart';

@injectable
class PaymentMethodScreen extends StatefulWidget {
  final PaymentCubit cubit;

  const PaymentMethodScreen(
    this.cubit,
  );

  @override
  State<PaymentMethodScreen> createState() => PaymentMethodScreenState();
}

class PaymentMethodScreenState extends State<PaymentMethodScreen> {
  @override
  void initState() {
    super.initState();
    widget.cubit.getCredits(this);
  }

  createCredit(CreateCreditRequest request) {
    widget.cubit.createCredit(this, request);
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
        title: Text('Select payment method'),
      ),
      body: BlocBuilder<PaymentCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return Stack(
            children: [
              state.getUI(context),
              TipDialogContainer(
                  duration: const Duration(seconds: 2),
                  outsideTouchable: true,
                  onOutsideTouch: (Widget tipDialog) {
                    if (tipDialog is TipDialog &&
                        tipDialog.type == TipDialogType.LOADING) {
                      TipDialogHelper.dismiss();
                    }
                  })
            ],
          );
        },
      ),
    );
  }
}
