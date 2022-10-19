import 'package:cater_me_v2/abstracts/response/action_response.dart';
import 'package:cater_me_v2/generated/l10n.dart';
import 'package:cater_me_v2/module_auth/enums/auth_status.dart';
import 'package:cater_me_v2/module_auth/exceptions/auth_exception.dart';
import 'package:cater_me_v2/module_auth/presistance/auth_prefs_helper.dart';
import 'package:cater_me_v2/module_auth/repository/auth/auth_repository.dart';
import 'package:cater_me_v2/module_auth/request/login_request/login_request.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AuthService {
  final AuthPrefsHelper _prefsHelper;
  final AuthRepository _authManager;
  final PublishSubject<AuthStatus> _authSubject = PublishSubject<AuthStatus>();

  AuthService(
    this._prefsHelper,
    this._authManager,
  );

  bool get isLoggedIn => _prefsHelper.isSignedIn();


  Stream<AuthStatus> get authListener => _authSubject.stream;
  String get username => _prefsHelper.getUsername() ?? '';
  String get password => _prefsHelper.getPassword() ?? '';


  Future<void> loginApi(String username, String password) async {
    // WebServiceResponse? loginResult = await _authManager.getToken(LoginRequest(
    //   username: username,
    //   password: password,
    // ));
    // if (loginResult == null) {
    //   await logout();
    //   _authSubject.addError('Connection error');
    //   throw AuthorizationException('Connection error');
    // } else if (  loginResult.code != 200  ) {
    //   await logout();
    //   _authSubject.addError(S.current.invalidCredentials);
    //   throw AuthorizationException(S.current.invalidCredentials);
    // }
    _prefsHelper.setUsername(username);
    _prefsHelper.setPassword(password);
    // _prefsHelper.setToken(loginResult.data!.token);
    _prefsHelper.setToken('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiNzg5NTExNzgiLCJQSUQiOiI4MTQiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjU4NGQ1YWRjLWY3NzEtNDQ3NC04MTBhLTY0Y2NhMGZmNjU2ZSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlVzZXIiLCJuYmYiOjE2NjUxNDExMjMsImV4cCI6MTY5NjY3NzEyMywiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NDQzMTAiLCJhdWQiOiJodHRwczovL2xvY2FsaG9zdDo0NDMxMCJ9.kXS72XWE3UrwJ3Ogk_tsD3ChfdmisKXVthQJwM_yWyE');
    _authSubject.add(AuthStatus.AUTHORIZED_CLIENT);
  }

  Future<String?> getToken() async {
    try {
      var tokenDate = _prefsHelper.getTokenDate();
      var diff = DateTime.now().difference(tokenDate).inMinutes;
      if (diff.abs() > 55) {
        throw TokenExpiredException('Token is created $diff minutes ago');
      }
      return _prefsHelper.getToken();
    } on AuthorizationException {
      _prefsHelper.deleteToken();
      await _prefsHelper.cleanAll();
      return null;
    } on TokenExpiredException {
      return await refreshToken();
    } catch (e) {
      await _prefsHelper.cleanAll();
      return null;
    }
  }

  /// refresh API token, this is done using Firebase Token Refresh
  Future<String?> refreshToken() async {
    String? username = _prefsHelper.getUsername();
    String? password = _prefsHelper.getPassword();
    if (username != null && password != null) {
      await loginApi(
        username,
        password,
      );
    }
    var token = await getToken();
    if (token != null) {
      return token;
    }
    throw const AuthorizationException('error getting token');
  }

  Future<void> logout() async {
    await _prefsHelper.cleanAll();
  }


}
