import 'package:cater_me_v2/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../state_manager/orders_state_manager.dart';

@injectable
class OrdersDetailsScreen extends StatefulWidget {
  final OrdersCubit cubit;

  const OrdersDetailsScreen(
    this.cubit,
  );

  @override
  State<OrdersDetailsScreen> createState() => OrdersDetailsScreenState();
}

class OrdersDetailsScreenState extends State<OrdersDetailsScreen> {
  String? orderId;
  bool falg = true;

  @override
  void initState() {
    super.initState();

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
    var args =  ModalRoute.of(context)?.settings.arguments;
    if(args != null && args is String){
      orderId = args;
      widget.cubit.getOrdersDetails(this ,orderId ?? '-1');
      falg=false;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).orders),
      ),
      body: BlocBuilder<OrdersCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      ),
    );
  }
}
