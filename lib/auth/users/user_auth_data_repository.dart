// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:move_on/src/base/api_sevices/errors/api_error.dart';
import 'package:move_on/src/base/firebase_services/auth_firebase_service.dart';
import 'package:move_on/src/base/api_sevices/errors/result_type.dart';
import 'package:move_on/auth/users/user_auth_data_decodable.dart';
import 'package:move_on/auth/users/user_auth_data_repository_body_parameters.dart';
import 'package:move_on/auth/users/get_user_auth_data_service.dart';
import 'package:move_on/src/base/sirvices/realtime_database_service/services/interfaces.dart';

class DefaultUserAuthDataRepository extends UserAuthDataRepository {
  final GetUserAuthDataService _getUserAuthDataService;

  DefaultUserAuthDataRepository(
      {GetUserAuthDataService? getUserAuthDataService})
      : _getUserAuthDataService =
            getUserAuthDataService ?? DefaultGetUserAuthDataService();
  @override
  Future<Result<UserAuthDataDecodable, Failure>> getUserAuthData(
      {required GetUserDataBodyParameters parameters}) async {
    try {
      final result = await _getUserAuthDataService.getUserAuthData(
          bodyparameters: parameters.toMap());
      UserAuthDataDecodable _decodable = UserAuthDataDecodable.fromMap(result);
      return Result.success(_decodable);
    } on Failure catch (e) {
      return Result.failure(
          Failure.getFirebaseAuthErrorMessage(error: e.error));
    }
  }
}
