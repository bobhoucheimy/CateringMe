import 'package:cater_me_v2/generated/l10n.dart';
import 'package:cater_me_v2/module_addresses/request/create_address_request.dart';
import 'package:cater_me_v2/module_addresses/response/address_response.dart';
import 'package:cater_me_v2/utils/components/custom_feild.dart';
import 'package:cater_me_v2/utils/components/custom_loading_button.dart';
import 'package:flutter/material.dart';


class CreateAddressSheet extends StatefulWidget {
  final Function(CreateAddressRequest) createAddress;
  final AddressResponse? response;
  final bool isUpdated;
  const CreateAddressSheet(
      {required this.createAddress, this.response, required this.isUpdated});

  @override
  State<CreateAddressSheet> createState() => _CreateOccasionCardState();
}

class _CreateOccasionCardState extends State<CreateAddressSheet> {
  var titleController = TextEditingController();
  var cityController = TextEditingController();
  var countryController = TextEditingController();
  var buldingNameController = TextEditingController();
  var floorController = TextEditingController();
  var streetController = TextEditingController();
  final GlobalKey<FormState> _addAddressKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if(widget.isUpdated){
      titleController.text  = widget.response?.title ??'';
      cityController.text  = widget.response?.city ??'';
      countryController.text  = widget.response?.country ??'';
      buldingNameController.text  = widget.response?.buildingName ??'';
      floorController.text  = widget.response?.floorNumber.toString() ??'';
      streetController.text  = widget.response?.street  ??'';
    }
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      maxChildSize: 0.9,
      builder: (context, scrollController) => Container(
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        child: ListView(
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
                  S.of(context).createAddress,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                leading: Icon(Icons.location_pin, color: Colors.white),

              ),
            ),
            Form(
              key: _addAddressKey,
              child: Column(children: [
                CustomFormField(
                  validator: true,
                  preIcon: Icon(
                    Icons.title,
                  ),
                  hintText: S.of(context).titleAddress,
                  controller: titleController,
                ),
                CustomFormField(
                  validator: true,
                  preIcon: Icon(
                    Icons.location_city,
                  ),
                  hintText: S.of(context).country,
                  controller: countryController,
                ),
                CustomFormField(
                  validator: true,
                  preIcon: Icon(
                    Icons.business_sharp,
                  ),
                  hintText: S.of(context).city,
                  controller: cityController,
                ),
                CustomFormField(
                  validator: true,
                  preIcon: Icon(
                    Icons.location_history,
                  ),
                  hintText: S.of(context).street,
                  controller: streetController,
                ),
                CustomFormField(
                  validator: true,
                  preIcon: Icon(
                    Icons.business_rounded,
                  ),
                  hintText: S.of(context).buildingName,
                  controller: buldingNameController,
                ),
                CustomFormField(
                  validator: true,
                  numbers: true,
                  preIcon: Icon(
                    Icons.business_rounded,
                  ),
                  hintText: S.of(context).floorNumber,
                  controller: floorController,
                ),
              ],),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CustomLoadingButton(
                bgColor: Theme.of(context).primaryColor,
                text: widget.isUpdated ? S.of(context).updateAddress : S.of(context).createAddress,
                textColor: Colors.white,
                loading: false,
                buttonTab: () {
                  if(_addAddressKey.currentState!.validate()){
                    widget.createAddress(
                      CreateAddressRequest(0, cityController.text,
                          countryController.text, streetController.text,
                          buldingNameController.text, titleController.text,
                          '', '',int.parse(floorController.text)  )
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
