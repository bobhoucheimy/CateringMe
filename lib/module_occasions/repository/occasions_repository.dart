import 'package:cater_me_v2/abstracts/response/action_response.dart';
import 'package:cater_me_v2/consts/urls.dart';
import 'package:cater_me_v2/http_client/http_client.dart';
import 'package:cater_me_v2/module_auth/service/auth_service/auth_service.dart';
import 'package:cater_me_v2/module_occasions/request/create_occasion_request.dart';
import 'package:injectable/injectable.dart';

@injectable
class OccasionsRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  OccasionsRepository(this._apiClient, this._authService);

  Future<WebServiceResponse?> getOccasions() async {
    var token = await _authService.getToken();
    WebServiceResponse? response = await _apiClient.get(
      Urls.GET_OCCASIONS,
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> createOccasion(
      CreateOccasionRequest request) async {
    var token = await _authService.getToken();
    WebServiceResponse? response = await _apiClient.post(
      Urls.CREATE_OCCASION,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> updateOccasion(
      CreateOccasionRequest request) async {
    var token = await _authService.getToken();
    WebServiceResponse? response = await _apiClient.put(
      Urls.UPDATE_OCCASION,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> deleteOccasion(String id) async {
    var token = await _authService.getToken();
    WebServiceResponse? response = await _apiClient.put(
      Urls.DELETE_OCCASION + '${id}',
      {},
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
}
