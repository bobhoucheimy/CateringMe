import 'package:cater_me_v2/module_addresses/response/address_response.dart';
import 'package:cater_me_v2/utils/images/images.dart';
import 'package:flutter/material.dart';

class AddressCard extends StatefulWidget {
  final AddressResponse model;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback? onSelect;
  final bool isSelectedPage;
  const AddressCard(
      {required this.model, required this.onEdit, required this.onDelete ,required this.isSelectedPage,  this.onSelect});

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(title: Text(widget.model.title ?? ''),subtitle: Text(widget.model.country ?? ''),
          leading: Image.asset(ImageAsset.ADDRESS),
          trailing:widget.isSelectedPage ?   InkWell(
            onTap: widget.onSelect,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child:
              Icon(widget.model.isSelected! ? Icons.check_circle_sharp
                  : Icons.circle_outlined ,
                color: Theme.of(context).primaryColor,size: 30,),
            ),
          ):
          SizedBox(
            width: 85,
            child: Row(
                children: [
                  InkWell(
                    onTap: widget.onEdit,
                    child: Card(
                        elevation: 3,
                        color:    Colors.green,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(Icons.edit ,color: Colors.white,size: 20,),
                        )),
                  ),
                  SizedBox(width: 5,),
                  InkWell(
                    onTap: widget.onDelete,
                    child: Card(
                        elevation: 3,
                        color:    Colors.red,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(Icons.delete ,color: Colors.white,size: 20,),
                        )),
                  ),
                ]),
          ),),
      )
    );
  }
}
