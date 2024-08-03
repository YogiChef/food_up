import 'package:move_on/src/base/api_sevices/errors/api_error.dart';
import 'package:move_on/src/base/firebase_services/auth_firebase_service.dart';

class DefaultSignInService extends SignInService {
  @override
  Future<Map<String, dynamic>>? signIn(
      {required Map<String, dynamic> bodyparameters}) {
    return apiService.getDataFromPostRequest(
        bodyParam: bodyparameters, url: endpoint);
  }

  @override
  Future<String> getIdToken(
      {required Map<String, dynamic> bodyparameters}) async {
    try {
      final userData = await signIn(bodyparameters: bodyparameters);
      return userData!['idToken'] as String;
    } on Failure catch (e) {
      return Future.error(Failure.getFirebaseAuthErrorMessage(error: e.error));
    }
  }
}
