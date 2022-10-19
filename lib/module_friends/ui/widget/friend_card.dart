import 'package:cater_me_v2/module_friends/response/friend_response.dart';
import 'package:flutter/material.dart';

class FriendCard extends StatelessWidget {
  final FriendsResponse model;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  const FriendCard(
      {required this.model, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(title: Text(model.name ?? ''),subtitle: Text(model.phoneNumber ?? ''),
          leading:CircleAvatar(backgroundImage: NetworkImage(model.image ?? '')) ,  trailing:  SizedBox(
            width: 85,
            child: Row(
                children: [
                  InkWell(
                    onTap: onEdit,
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
                    onTap: onDelete,
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
