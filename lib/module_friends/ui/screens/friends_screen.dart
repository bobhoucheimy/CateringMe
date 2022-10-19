import 'package:cater_me_v2/generated/l10n.dart';
import 'package:cater_me_v2/module_friends/request/create_friend_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../state_manager/friends_state_manager.dart';
import '../widget/create_friend_sheet.dart';

@injectable
class FriendsScreen extends StatefulWidget {
  final FriendsCubit cubit;

  const FriendsScreen(
    this.cubit,
  );

  @override
  State<FriendsScreen> createState() => FriendsScreenState();
}

class FriendsScreenState extends State<FriendsScreen> {
  @override
  void initState() {
    super.initState();
    widget.cubit.getFriends(this);
  }

  getFriends() {
    widget.cubit.getFriends(this);
  }
  createFriend(CreateFriendRequest request) {
    widget.cubit.createFriend(this , request);
  }

  updateFriend(CreateFriendRequest occasionRequest) {
    widget.cubit.updateFriend(this , occasionRequest);
  }
  deleteFriend(String id) {
    widget.cubit.deleteFriend(this , id);
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
        title: Text(S.of(context).friends),
        actions: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return CreateFriendSheet(createFriend: (req){
                      createFriend(req);
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
      body: BlocBuilder<FriendsCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      ),
    );
  }
}
