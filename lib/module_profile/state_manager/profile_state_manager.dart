import 'package:cater_me_v2/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import '../../abstracts/states/error_state.dart';
import '../../abstracts/states/loading_state.dart';
import '../../abstracts/states/state.dart';
import '../repository/profile_repository.dart';
import '../request/edit_profile_request.dart';
import '../response/get_profile_response.dart';
import '../ui/screen/edit_profile_screen.dart';
import '../ui/state/edit_profile_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class ProfileCubit extends Cubit<States> {
  final ProfileRepository _profileRepository;

  ProfileCubit(this._profileRepository) : super(LoadingState());

  final _loadingStateSubject = PublishSubject<AsyncSnapshot>();
  Stream<AsyncSnapshot> get loadingStream => _loadingStateSubject.stream;

  updateProf(
      {required UpdateProfileRequest request,
      required EditProfileScreenState screenState}) {
    _loadingStateSubject.add(AsyncSnapshot.waiting());
    _profileRepository.editProfile(request).then((value) {
      if (value == null) {
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(
            msg: 'Connection error', backgroundColor: Colors.red);
      } else if (value.code == 200) {
        Navigator.pop(screenState.context);
        Fluttertoast.showToast(
            msg: S.current.updateSuccessfully, backgroundColor: Colors.green);
      } else {
        _loadingStateSubject.add(AsyncSnapshot.nothing());
        Fluttertoast.showToast(
            msg: value.errorMessage, backgroundColor: Colors.red);
      }
    });
  }

  getProfile(EditProfileScreenState state) {
    emit(LoadingState());
    _profileRepository.getProfile().then((value) {
      if (value == null) {
        emit(ErrorState(
            errMsg: 'Connection error',
            retry: () {
              getProfile(state);
            }));
      } else if (value.code == 200) {
        ProfileResponse getProfileModel =
            ProfileResponse.fromJson(value.data.insideData);

        emit(
          EditProfileSate(model: getProfileModel, screenState: state),
        );
      }
    });
  }
}
