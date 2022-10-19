import 'package:cater_me_v2/abstracts/response/action_response.dart';
import 'package:cater_me_v2/consts/urls.dart';
import 'package:cater_me_v2/http_client/http_client.dart';
import 'package:cater_me_v2/module_auth/service/auth_service/auth_service.dart';
import 'package:cater_me_v2/module_friends/request/create_friend_request.dart';
import 'package:injectable/injectable.dart';

@injectable
class FriendsRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  FriendsRepository(this._apiClient, this._authService);

  Future<WebServiceResponse?> getFriends() async {
    var token = await _authService.getToken();
    WebServiceResponse? response = await _apiClient.get(
      Urls.GET_FRIENDS,
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> createFriend(
      CreateFriendRequest request) async {
    var token = await _authService.getToken();
    WebServiceResponse? response = await _apiClient.post(
      Urls.CREATE_FRIEND,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> updateFriend(
      CreateFriendRequest request) async {
    var token = await _authService.getToken();
    WebServiceResponse? response = await _apiClient.put(
      Urls.UPDATE_FRIEND,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> deleteFriend(String id) async {
    var token = await _authService.getToken();
    WebServiceResponse? response = await _apiClient.put(
      Urls.DELETE_FRIEND + '${id}',
      {},
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
}
