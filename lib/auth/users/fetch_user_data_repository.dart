// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:move_on/src/base/api_sevices/errors/api_error.dart';
import 'package:move_on/auth/users/user_decodable.dart';
import 'package:move_on/src/base/sirvices/realtime_database_service/interfaces.dart';
import 'package:move_on/src/base/sirvices/realtime_database_service/services/realtime_datbase_service.dart';
import 'package:move_on/src/base/api_sevices/errors/result_type.dart';
import 'package:move_on/src/base/sirvices/realtime_database_service/services/interfaces.dart';

extension Paths on DefaultFetchUserDataRepository {
  static String path = 'users/';
}

class DefaultFetchUserDataRepository extends FetchUserDataRepository {
  final RealtimeDatabaseService _databaseService;

  DefaultFetchUserDataRepository({RealtimeDatabaseService? databaseService})
      : _databaseService = databaseService ?? DefaultRealtimeDatabaseService();
  @override
  Future<Result<UserDecodable, Failure>> fetchUserData(
      {required String localId}) async {
    var fullpath = path + localId;
    try {
      final result = await _databaseService.getData(path: fullpath);
      UserDecodable _decodable = UserDecodable.fromMap(result);
      return Result.success(_decodable);
    } on Failure catch (e) {
      return Result.failure(e);
    }
  }
}
