import 'package:move_on/src/base/firebase_services/auth_firebase_service.dart';

class DefaultSignUpSevice extends SignUpService {
  @override
  Future<Map<String, dynamic>>? signUp(
      {required Map<String, dynamic> bodyparameters}) async {
    return apiService.getDataFromPostRequest(
        bodyParam: bodyparameters, url: endpoint);
  }
}
