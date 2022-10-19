import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:injectable/injectable.dart';

import '../../../abstracts/states/state.dart';

import '../../request/edit_profile_request.dart';
import '../../state_manager/profile_state_manager.dart';

@injectable
class EditProfileScreen extends StatefulWidget {
  final ProfileCubit cubit;

  const EditProfileScreen(this.cubit);

  @override
  State<EditProfileScreen> createState() => EditProfileScreenState();
}

class EditProfileScreenState extends State<EditProfileScreen> {
  late AsyncSnapshot loadingSnapshotLogin;

  @override
  void initState() {
    super.initState();
    widget.cubit.getProfile(this);
    loadingSnapshotLogin = AsyncSnapshot.nothing();
    widget.cubit.loadingStream.listen((event) {
      if (mounted) {
        setState(() {
          loadingSnapshotLogin = event;
        });
      }
    });
  }

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  void getProfile(){
    widget.cubit.getProfile(this);
  }

  void updateProfile(UpdateProfileRequest updateRequest){
    widget.cubit.updateProf(request: updateRequest , screenState: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
          ),
        ),

      ),
      body: BlocBuilder<ProfileCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      ),
    );
  }
}
