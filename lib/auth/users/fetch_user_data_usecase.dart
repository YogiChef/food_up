import 'package:move_on/src/base/api_sevices/errors/api_error.dart';
import 'package:move_on/src/base/api_sevices/errors/error_message.dart';
import 'package:move_on/src/base/api_sevices/errors/result_type.dart';
import 'package:move_on/auth/users/fetch_user_data_repository.dart';
import 'package:move_on/auth/users/user_entity.dart';
import 'package:move_on/src/base/sirvices/realtime_database_service/services/interfaces.dart';

abstract class FetchUserDataUseCase {
  Future<Result<UserEntity, Failure>> execute({required String localId});
}

class DefaultFetchUserDataUseCase extends FetchUserDataUseCase {
  final FetchUserDataRepository _fetchUserDataRepository;

  DefaultFetchUserDataUseCase(
      {FetchUserDataRepository? fetchUserDataRepository})
      : _fetchUserDataRepository =
            fetchUserDataRepository ?? DefaultFetchUserDataRepository();
  @override
  Future<Result<UserEntity, Failure>> execute({required String localId}) {
    return _fetchUserDataRepository
        .fetchUserData(localId: localId)
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          if (result.value == null) {
            return Result.failure(Failure.fromMessage(
                message: FailureMessages.unExpectedErrorMessage));
          }
          return Result.success(UserEntity.fromMap(result.value!.toMap()));
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}
