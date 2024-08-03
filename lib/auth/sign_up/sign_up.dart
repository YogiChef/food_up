import 'package:move_on/src/base/api_sevices/errors/api_error.dart';
import 'package:move_on/src/base/firebase_services/auth_firebase_service.dart';
import 'package:move_on/auth/sign_up/sign_up_decodables.dart';
import 'package:move_on/auth/sign_up/sign_up_auth_sevice.dart';
import 'package:move_on/src/base/api_sevices/errors/result_type.dart';
import 'package:move_on/auth/sign_up/sign_up_repository.dart';
import 'package:move_on/src/base/sirvices/realtime_database_service/services/interfaces.dart';

class DefaultSignUpRepository extends SignUpRepository {
  final SignUpService _signUpService;
  DefaultSignUpRepository({SignUpService? signUpService})
      : _signUpService = signUpService ?? DefaultSignUpSevice();

  @override
  Future<Result<SignUpDecodable, Failure>> signUp(
      {required SignUpRepositoryParameters parames}) async {
    try {
      final result =
          await _signUpService.signUp(bodyparameters: parames.toMap());
      SignUpDecodable decodable = SignUpDecodable.fromMap(result!);
      return Result.success(decodable);
    } on Failure catch (e) {
      return Result.failure(
          Failure.getFirebaseAuthErrorMessage(error: e.error));
    }
  }
}
