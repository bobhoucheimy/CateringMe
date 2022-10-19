import 'package:cater_me_v2/module_addresses/ui/widget/address_card.dart';
import 'package:flutter/material.dart';
import '../../../abstracts/states/state.dart';
import '../../response/address_response.dart';
import '../screens/address_screen.dart';
import '../widget/create_address_sheet.dart';

class AddressListSuccess extends States {
  final List<AddressResponse> addressList;
  AddressScreenState screenState;

  AddressListSuccess({required this.addressList, required this.screenState});

  @override
  Widget getUI(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => AddressCard(
        model: addressList[index],
        isSelectedPage: false,
        onDelete: () {
          screenState.deleteAddress(addressList[index].id.toString());
        },
        onEdit: () {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return CreateAddressSheet(
                  createAddress: (req) {
                    req.id = addressList[index].id;
                    screenState.updateAddress(req);
                  },
                  isUpdated: true,
                  response: addressList[index],
                );
              },
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(15))),
              isScrollControlled: true,
              elevation: 5);
        },
      ),
      itemCount: addressList.length,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
