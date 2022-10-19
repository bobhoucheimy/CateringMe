import 'package:cater_me_v2/abstracts/response/action_response.dart';
import 'package:cater_me_v2/consts/urls.dart';
import 'package:cater_me_v2/http_client/http_client.dart';
import 'package:cater_me_v2/module_auth/service/auth_service/auth_service.dart';
import 'package:cater_me_v2/module_credits/request/create_credit_request.dart';
 import 'package:injectable/injectable.dart';

@injectable
class CreditsRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  CreditsRepository(this._apiClient, this._authService);

  Future<WebServiceResponse?> getCredits() async {
    var token = await _authService.getToken();
    WebServiceResponse? response = await _apiClient.get(
      Urls.GET_CREDITS,
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> createCredit(
      CreateCreditRequest request) async {
    var token = await _authService.getToken();
    WebServiceResponse? response = await _apiClient.post(
      Urls.CREATE_CREDITS,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }



  Future<WebServiceResponse?> deleteCredit(String id) async {
    var token = await _authService.getToken();
    WebServiceResponse? response = await _apiClient.put(
      Urls.DELETE_CREDITS + '${id}',
      {},
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
}
