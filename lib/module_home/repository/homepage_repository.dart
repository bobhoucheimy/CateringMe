import 'package:cater_me_v2/abstracts/response/action_response.dart';
import 'package:cater_me_v2/consts/urls.dart';
import 'package:cater_me_v2/http_client/http_client.dart';
import 'package:cater_me_v2/module_auth/service/auth_service/auth_service.dart';
import 'package:cater_me_v2/module_home/request/place_order_request.dart';
import 'package:injectable/injectable.dart';


@injectable
class HomePageRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  HomePageRepository(this._apiClient, this._authService);

  Future<WebServiceResponse?> getHomePage() async {
    var token = await _authService.getToken();

    WebServiceResponse? response = await _apiClient.get(
      Urls.GET_HOME_PAGE,
      headers: {'Authorization': 'Bearer ' '$token'},

    );
    if (response == null) return null;
    return response;
  }

  Future<WebServiceResponse?> placeOrder(PlaceOrderRequest request) async {
    var token = await _authService.getToken();
    WebServiceResponse? response = await _apiClient.post(
      Urls.PLACE_ORDER,
      request.toJson(),
      headers: {'Authorization': 'Bearer ' '$token'},
    );
    if (response == null) return null;
    return response;
  }
}
