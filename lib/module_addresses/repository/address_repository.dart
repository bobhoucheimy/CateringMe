import 'package:cater_me_v2/abstracts/response/action_response.dart';
import 'package:cater_me_v2/consts/urls.dart';
import 'package:cater_me_v2/http_client/http_client.dart';
import 'package:cater_me_v2/module_addresses/request/create_address_request.dart';
import 'package:cater_me_v2/module_auth/service/auth_service/auth_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddressRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  AddressRepository(this._apiClient, this._authService);

  Future<WebServiceResponse?> getAddress() async {
    var token = await _authService.getToken();
    WebServiceResponse? response = await _apiClient.get(
      Urls.GET_ADDRESSES,
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> createAddress(
      CreateAddressRequest request) async {
    var token = await _authService.getToken();
    WebServiceResponse? response = await _apiClient.post(
      Urls.CREATE_ADDRESS,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> updateAddress(
      CreateAddressRequest request) async {
    var token = await _authService.getToken();
    WebServiceResponse? response = await _apiClient.put(
      Urls.UPDATE_ADDRESS,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> deleteAddress(String id) async {
    var token = await _authService.getToken();
    WebServiceResponse? response = await _apiClient.put(
      Urls.DELETE_ADDRESS + '${id}',
      {},
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
}
