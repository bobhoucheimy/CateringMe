import 'package:cater_me_v2/abstracts/response/action_response.dart';
import 'package:cater_me_v2/consts/urls.dart';
import 'package:cater_me_v2/http_client/http_client.dart';
import 'package:cater_me_v2/module_auth/service/auth_service/auth_service.dart';
import 'package:injectable/injectable.dart';
import '../request/edit_profile_request.dart';

@injectable
class ProfileRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  ProfileRepository(this._apiClient, this._authService);

  Future<WebServiceResponse?> editProfile(UpdateProfileRequest request) async {
    var token = await _authService.getToken();
    WebServiceResponse? response = await _apiClient.put(
      Urls.UPDATE_PROFILE,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> getProfile() async {
    var token = await _authService.getToken();

    WebServiceResponse? response = await _apiClient.get(
      Urls.GET_PROFILE,
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
}
