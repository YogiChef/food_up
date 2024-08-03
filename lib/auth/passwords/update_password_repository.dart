// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:move_on/src/base/api_sevices/errors/api_error.dart';
import 'package:move_on/src/base/firebase_services/auth_firebase_service.dart';
import 'package:move_on/auth/passwords/update_password_decodable.dart';
import 'package:move_on/src/base/api_sevices/errors/result_type.dart';
import 'package:move_on/src/base/sirvices/realtime_database_service/services/interfaces.dart';
import 'package:move_on/auth/passwords/update_password_user_service.dart';

class DefaultUpdatePasswordRepository extends UpdatePasswordRepository {
  final UpdatePasswordUserService _updatePasswordUserService;

  DefaultUpdatePasswordRepository(
      {UpdatePasswordUserService? updatePasswordUserService})
      : _updatePasswordUserService =
            updatePasswordUserService ?? DefaultUpdatePasswordUserService();
  @override
  Future<Result<UpdatePasswordDecodable, Failure>> updatePassword(
      {required String email}) async {
    try {
      final result =
          await _updatePasswordUserService.updatePassword(email: email);
      UpdatePasswordDecodable _decodable =
          UpdatePasswordDecodable.fromMap(result);
      return Result.success(_decodable);
    } on Failure catch (e) {
      return Result.failure(
          Failure.getFirebaseAuthErrorMessage(error: e.error));
    }
  }
}
