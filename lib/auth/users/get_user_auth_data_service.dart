import 'package:move_on/src/base/firebase_services/auth_firebase_service.dart';

class DefaultGetUserAuthDataService extends GetUserAuthDataService {
  @override
  Future<Map<String, dynamic>> getUserAuthData(
      {required Map<String, dynamic> bodyparameters}) {
    return apiService.getDataFromPostRequest(
        bodyParam: bodyparameters, url: endpoint);
  }
}
