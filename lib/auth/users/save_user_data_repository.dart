import 'package:move_on/src/base/api_sevices/errors/api_error.dart';
import 'package:move_on/src/base/api_sevices/errors/error_message.dart';
import 'package:move_on/auth/users/user_decodable.dart';
import 'package:move_on/src/base/sirvices/realtime_database_service/interfaces.dart';
import 'package:move_on/src/base/sirvices/realtime_database_service/services/realtime_datbase_service.dart';
import 'package:move_on/src/base/api_sevices/errors/result_type.dart';
import 'package:move_on/auth/users/user_body_parameters.dart';
import 'package:move_on/src/base/sirvices/realtime_database_service/services/interfaces.dart';

abstract class _Paths {
  static String userCollection = "users/";
}

class DefaultSaveUserDataRepository extends SaveUserDataRepository {
  final RealtimeDatabaseService _databaseService;
  DefaultSaveUserDataRepository({RealtimeDatabaseService? databaseService})
      : _databaseService = databaseService ?? DefaultRealtimeDatabaseService();

  @override
  Future<Result<UserDecodable, Failure>> saveUserData(
      {required UserBodyParameters parameters}) async {
    if (parameters.localId == null) {
      return Result.failure(
          Failure.fromMessage(message: FailureMessages.unExpectedErrorMessage));
    }
    var path = _Paths.userCollection + parameters.localId!;

    try {
      final result = await _databaseService.putData(
          bodyParameters: parameters.toMap(), path: path);
      UserDecodable decodable = UserDecodable.fromMap(result);
      return Result.success(decodable);
    } on Failure catch (e) {
      return Result.failure(e);
    }
  }
}
