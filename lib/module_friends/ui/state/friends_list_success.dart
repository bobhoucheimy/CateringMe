import 'package:cater_me_v2/module_friends/ui/widget/friend_card.dart';
import 'package:flutter/material.dart';
import '../../../abstracts/states/state.dart';
import '../../response/friend_response.dart';
import '../screens/friends_screen.dart';
import '../widget/create_friend_sheet.dart';


class FriendsListSuccess extends States {

  final List<FriendsResponse> friendsList;
  FriendsScreenState screenState;

  FriendsListSuccess({required this.friendsList, required this.screenState});

  @override
  Widget getUI(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) =>  FriendCard(
          model: friendsList[index],
          onDelete: () {
            screenState.deleteFriend(friendsList[index].id.toString());
          },
          onEdit: () {
            showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return CreateFriendSheet(
                    createFriend: (req) {
                      req.id = friendsList[index].id;
                      screenState.updateFriend(req);
                    },
                    isUpdated: true,
                    response: friendsList[index],
                  );
                },
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(15))),
                isScrollControlled: true,
                elevation: 5);
          },
        ),
      itemCount: friendsList.length,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
    );
  }
}
