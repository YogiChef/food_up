import 'package:move_on/src/base/api_sevices/errors/api_error.dart';
import 'package:move_on/src/base/firebase_services/auth_firebase_service.dart';
import 'package:move_on/auth/login/sign_in_decodables.dart';
import 'package:move_on/auth/login/login_auth_service.dart';
import 'package:move_on/src/base/api_sevices/errors/result_type.dart';
import 'package:move_on/auth/login/sign_in_body_parameters.dart';
import 'package:move_on/src/base/sirvices/realtime_database_service/services/interfaces.dart';

class DefaultSignInRepository extends SignInRepository {
  final SignInService _signInService;

  DefaultSignInRepository({SignInService? signInService})
      : _signInService = signInService ?? DefaultSignInService();
  @override
  Future<Result<SignInDecodable, Failure>> signIn(
      {required SignInBodyParameters params}) async {
    try {
      final result =
          await _signInService.signIn(bodyparameters: params.toMap());
      SignInDecodable decodable = SignInDecodable.fromMap(result!);
      return Result.success(decodable);
    } on Failure catch (e) {
      return Result.failure(
          Failure.getFirebaseAuthErrorMessage(error: e.error));
    }
  }
}
