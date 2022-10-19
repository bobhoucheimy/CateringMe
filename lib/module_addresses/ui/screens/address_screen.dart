import 'package:cater_me_v2/generated/l10n.dart';
import 'package:cater_me_v2/module_addresses/request/create_address_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../state_manager/address_state_manager.dart';
import '../widget/create_address_sheet.dart';

@injectable
class AddressScreen extends StatefulWidget {
  final AddressCubit cubit;

  const AddressScreen(
    this.cubit,
  );

  @override
  State<AddressScreen> createState() => AddressScreenState();
}

class AddressScreenState extends State<AddressScreen> {
 late bool goToSelectedState;
  bool flags = true;
  @override
  void initState() {
    super.initState();

  }

  getAddress() {
    widget.cubit.getAddress(this);
  }
  createAddress(CreateAddressRequest request) {
    widget.cubit.createAddress(this , request);
  }

  updateAddress(CreateAddressRequest occasionRequest) {
    widget.cubit.updateAddress(this , occasionRequest);
  }
  deleteAddress(String id) {
    widget.cubit.deleteAddress(this , id);
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
    var args = ModalRoute.of(context)?.settings.arguments;
    if (args != null  && flags) {
      goToSelectedState = args as bool;
      widget.cubit.getAddress(this,goToSelectedState);
      flags = false;
    }else if (flags){
      widget.cubit.getAddress(this,false);
      flags = false;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).address),
        actions: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return CreateAddressSheet(createAddress: (req){
                      createAddress(req);
                    },isUpdated: false,);
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
      body: BlocBuilder<AddressCubit , States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      ),
    );
  }
}
