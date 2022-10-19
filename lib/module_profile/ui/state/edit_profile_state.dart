import 'package:cater_me_v2/generated/l10n.dart';
import 'package:cater_me_v2/module_profile/request/edit_profile_request.dart';
import 'package:cater_me_v2/utils/components/custom_feild.dart';
import 'package:cater_me_v2/utils/components/custom_loading_button.dart';
import 'package:flutter/material.dart';
import '../../../abstracts/states/state.dart';
import '../../response/get_profile_response.dart';
import '../screen/edit_profile_screen.dart';

class EditProfileSate extends States {
  EditProfileScreenState screenState;
  ProfileResponse model;

  EditProfileSate({
    required this.screenState,
    required this.model,
  }) :super(){
    nameController.text = model.name ?? '' ;
    numberController.text = model.phoneNumber ?? '' ;
  }

  var nameController = TextEditingController();
  var numberController = TextEditingController();
  final GlobalKey<FormState> _updateProKey = GlobalKey<FormState>();

  @override
  Widget getUI(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Form(
          key: _updateProKey,
          child: Column(
            children: [
              CustomFormField(controller: nameController , validator: true , ),

              CustomFormField(controller: numberController , validator: true , phone: true,),
              SizedBox(
                height: 60,
              ),
              CustomLoadingButton(
                bgColor: Theme.of(context).primaryColor,
                text: S.of(context).updateProfile,
                textColor: Colors.white,
                loading: screenState.loadingSnapshotLogin.connectionState ==
                    ConnectionState.waiting,
                buttonTab: () {
                  if(_updateProKey.currentState!.validate()){
                    screenState.updateProfile(UpdateProfileRequest(Name: nameController.text ,PhoneNumber: numberController.text ));
                  }

                },),
            ],
          ),
        ),
      ),
    );
  }
}
