// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:move_on/src/base/firebase_services/auth_firebase_service.dart';
import 'package:move_on/auth/passwords/update_password_body_parameter.dart';

class DefaultUpdatePasswordUserService extends UpdatePasswordUserService {
  final String requestType = "PASSWORD_RESET";
  @override
  Future<Map<String, dynamic>> updatePassword({required String email}) {
    final _params =
        UpdatePasswordBodyParameters(requestType: requestType, email: email);
    return apiService.getDataFromPostRequest(
        bodyParam: _params.toMap(), url: endpoint);
  }
}
