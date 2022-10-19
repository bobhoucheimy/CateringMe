import 'package:cater_me_v2/abstracts/states/error_state.dart';
import 'package:cater_me_v2/module_friends/repository/friends_repository.dart';
import 'package:cater_me_v2/module_friends/request/create_friend_request.dart';
import 'package:cater_me_v2/module_friends/response/friend_response.dart';
import 'package:cater_me_v2/module_friends/ui/state/friends_list_success.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../abstracts/states/loading_state.dart';
import '../../abstracts/states/state.dart';
import '../ui/screens/friends_screen.dart';


@injectable
class FriendsCubit extends Cubit<States> {
  final FriendsRepository _friendsRepository;
  FriendsCubit(this._friendsRepository) : super(LoadingState());

  getFriends(FriendsScreenState screenState) {
    emit(LoadingState());
    _friendsRepository.getFriends().then((value) {
      if (value == null) {
        emit(ErrorState(
            errMsg: 'Connection error',
            retry: () {
              getFriends(screenState);
            }));
      } else if (value.code == 200) {
        List<FriendsResponse> occList = [];
        for (var item in value.data.insideData) {
          occList.add(FriendsResponse.fromJson(item));
        }
        emit(FriendsListSuccess(
            screenState: screenState, friendsList: occList));
      } else {
        emit(ErrorState(
            errMsg: value.errorMessage,
            retry: () {
              getFriends(screenState);
            }));
      }
    });
  }

  createFriend(
      FriendsScreenState screenState, CreateFriendRequest request) {
    emit(LoadingState());
    _friendsRepository.createFriend(request).then((value) {
      if (value == null) {
        emit(ErrorState(
            errMsg: 'Connection error',
            retry: () {
              getFriends(screenState);
            }));
      } else if (value.code == 201) {
        getFriends(screenState);
      } else {
        emit(ErrorState(
            errMsg: value.errorMessage,
            retry: () {
              getFriends(screenState);
            }));
      }
    });
  }

  updateFriend(
      FriendsScreenState screenState, CreateFriendRequest request) {
    emit(LoadingState());
    _friendsRepository.updateFriend(request).then((value) {
      if (value == null) {
        emit(ErrorState(
            errMsg: 'Connection error',
            retry: () {
              getFriends(screenState);
            }));
      } else if (value.code == 201) {
        getFriends(screenState);
      } else {
        emit(ErrorState(
            errMsg: value.errorMessage,
            retry: () {
              getFriends(screenState);
            }));
      }
    });
  }

  deleteFriend(FriendsScreenState screenState, String id) {
    emit(LoadingState());
    _friendsRepository.deleteFriend(id).then((value) {
      if (value == null) {
        emit(ErrorState(
            errMsg: 'Connection error',
            retry: () {
              getFriends(screenState);
            }));
      } else if (value.code == 200) {
        getFriends(screenState);
      } else {
        emit(ErrorState(
            errMsg: value.errorMessage,
            retry: () {
              getFriends(screenState);
            }));
      }
    });
  }
}
