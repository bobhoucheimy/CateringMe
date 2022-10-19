import 'package:cater_me_v2/abstracts/module/yes_module.dart';
import 'package:cater_me_v2/module_profile/ui/screen/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'profile_route.dart';

@injectable
class ProfileModule extends RoutModule {
  final EditProfileScreen _editProfileSate;

  ProfileModule(this._editProfileSate,  ) {
    RoutModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {
      ProfileRoutes.editProfile: (context) => _editProfileSate,
    };
  }
}
