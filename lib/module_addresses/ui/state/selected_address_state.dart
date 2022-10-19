import 'package:cater_me_v2/module_addresses/ui/widget/address_card.dart';
import 'package:flutter/material.dart';
import '../../../abstracts/states/state.dart';
import '../../response/address_response.dart';
import '../screens/address_screen.dart';
import '../widget/create_address_sheet.dart';

class SelectAddressListSuccess extends States {
  final List<AddressResponse> addressList;
  AddressScreenState screenState;

  SelectAddressListSuccess({required this.addressList, required this.screenState});

  AddressResponse? _selectAddress;
  @override
  Widget getUI(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) => AddressCard(
          model: addressList[index],
          isSelectedPage: true,
          onDelete: () {
          },
          onEdit: () {
          },
          onSelect: (){
            addressList.forEach((element) {
              element.isSelected = false;
            });
            addressList[index].isSelected = true;
            _selectAddress = addressList[index];
            screenState.refresh();
          },
        ),
        itemCount: addressList.length,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
      ),
      floatingActionButton:_selectAddress != null? FloatingActionButton(onPressed: (){
        Navigator.pop(context,_selectAddress);
      },child: Icon(Icons.done_all_sharp) ,backgroundColor: Theme.of(context).primaryColor,) : Container()
    );
  }
}
