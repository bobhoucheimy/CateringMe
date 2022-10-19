import 'package:cater_me_v2/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../state_manager/orders_state_manager.dart';

@injectable
class OrdersScreen extends StatefulWidget {
  final OrdersCubit cubit;

  const OrdersScreen(
    this.cubit,
  );

  @override
  State<OrdersScreen> createState() => OrdersScreenState();
}

class OrdersScreenState extends State<OrdersScreen> {
  @override
  void initState() {
    super.initState();
    widget.cubit.getOrders(this);
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
