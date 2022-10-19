import 'package:cater_me_v2/generated/l10n.dart';
import 'package:cater_me_v2/module_credits/request/create_credit_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../state_manager/credits_state_manager.dart';
import '../widget/create_credit_sheet.dart';

@injectable
class CreditScreen extends StatefulWidget {
  final CreditsCubit cubit;

  const CreditScreen(
    this.cubit,
  );

  @override
  State<CreditScreen> createState() => CreditScreenState();
}

class CreditScreenState extends State<CreditScreen> {
  @override
  void initState() {
    super.initState();
    widget.cubit.getCredits(this);
  }

  getCredit() {
    widget.cubit.getCredits(this);
  }
  createCredit(CreateCreditRequest request) {
    widget.cubit.createCredit(this , request);
  }

  deleteCredit(String id) {
    widget.cubit.deleteCredit(this , id);
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
        title: Text(S.of(context).credits),
        actions: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return  CreateCreditSheet(createCredit: (request){
                      Navigator.pop(context);
                      widget.cubit.createCredit(this, request);
                    },);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15))),
                  isScrollControlled: true,
                  elevation: 5);
            },
            child: Padding(
              padding: const EdgeInsetsDirectional.only(end: 25),
              child: Icon(Icons.add_comment),
            ),
          )
        ],
      ),
      body: BlocBuilder<CreditsCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      ),
    );
  }
}
