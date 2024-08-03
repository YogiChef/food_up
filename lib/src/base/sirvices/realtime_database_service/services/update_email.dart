import 'package:move_on/src/base/api_sevices/errors/api_error.dart';
import 'package:move_on/src/base/firebase_services/auth_firebase_service.dart';
import 'package:move_on/auth/login/login_auth_service.dart';

class DefaultUpdateEmailUserService extends UpdateEmailUserService {
  final SignInService _signInService;
  DefaultUpdateEmailUserService({SignInService? signInService})
      : _signInService = signInService ?? DefaultSignInService();

  @override
  Future<Map<String, dynamic>> updateEmail(
      {required String oldEmail,
      required String newEmail,
      required String password}) async {
    try {
      final Map<String, dynamic> signInBodyParameters = {
        'email': oldEmail,
        'password': password,
        'returnSecureToken': true,
      };
      final idToken =
          await _signInService.getIdToken(bodyparameters: signInBodyParameters);
      final Map<String, dynamic> bodyParameters = {
        'email': newEmail,
        'password': idToken,
        'returnSecureToken': true,
      };
      return apiService.getDataFromPostRequest(
          bodyParam: bodyParameters, url: endpoint);
    } on Failure catch (e) {
      return Future.error(Failure.getFirebaseAuthErrorMessage(error: e.error));
    }
  }
}
