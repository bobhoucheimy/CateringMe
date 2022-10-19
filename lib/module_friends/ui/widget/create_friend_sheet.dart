import 'package:cater_me_v2/generated/l10n.dart';
import 'package:cater_me_v2/module_friends/request/create_friend_request.dart';
import 'package:cater_me_v2/module_friends/response/friend_response.dart';
import 'package:cater_me_v2/utils/components/custom_feild.dart';
import 'package:cater_me_v2/utils/components/custom_loading_button.dart';
import 'package:flutter/material.dart';
 import 'package:fluttercontactpicker/fluttercontactpicker.dart';


class CreateFriendSheet extends StatefulWidget {
  final Function(CreateFriendRequest) createFriend;
  final FriendsResponse? response;
  final bool isUpdated;
  const CreateFriendSheet(
      {required this.createFriend, this.response, required this.isUpdated});

  @override
  State<CreateFriendSheet> createState() => _CreateOccasionCardState();
}

class _CreateOccasionCardState extends State<CreateFriendSheet> {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();


  final GlobalKey<FormState> _addFriendKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (context, scrollController) => Container(
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
        child: ListView(
          controller: scrollController,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [

            Form(
              key: _addFriendKey,
              child: Column(children: [
                CustomFormField(
                  validator: true,
                  preIcon: Icon(
                    Icons.person,
                  ),
                  hintText: S.of(context).friendName,
                  controller: nameController,
                ),
                CustomFormField(
                  validator: true,
                  preIcon: Icon(
                    Icons.phone_android,
                  ),
                  hintText: S.of(context).phoneNumber,
                  controller: phoneController,
                ),
              ],),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(S.of(context).selectFromContact,style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18),),
                InkWell(
                  onTap: ()async{

                    final FullContact contact =
                    (await FlutterContactPicker.pickFullContact());
                    print('--------------------------------');
                    print(contact.name?.firstName);
                    print(contact.phones.first.number);
                    setState(() {
                    nameController.text = contact.name?.firstName ?? '';
                    phoneController.text = contact.phones.first.number.toString();
                    });
                  },
                  child: Card(
                      elevation: 3,
                      color:  Colors.green.shade900,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(Icons.contact_phone_sharp ,color: Colors.white,size: 20,),
                      )),
                ),
              ],
            ),


            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CustomLoadingButton(
                bgColor: Theme.of(context).primaryColor,
                text: widget.isUpdated ? S.of(context).updateFriend : S.of(context).createFriend,
                textColor: Colors.white,
                loading: false,
                buttonTab: () {
                  if(_addFriendKey.currentState!.validate()){

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
