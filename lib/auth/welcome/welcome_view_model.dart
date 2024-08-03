import 'package:move_on/src/base/api_sevices/errors/api_error.dart';
import 'package:move_on/src/base/sirvices/google_signin/google_sign_in_usecase.dart';
import 'package:move_on/auth/login/loading_provider.dart';
import 'package:move_on/src/base/api_sevices/errors/result_type.dart';
import 'package:move_on/auth/users/user_entity.dart';
import 'package:move_on/src/views/base_view.dart';

abstract class WelcomeViewModelInput {
  Future<Result<UserEntity, Failure>> signInWithGoogle();
}

abstract class WelcomeViewModel extends WelcomeViewModelInput
    with BaseViewModel {}

class DefaultWelcomeViewModel extends WelcomeViewModel {
  final GoogleSignInUseCase _signInUseCase;

  DefaultWelcomeViewModel({GoogleSignInUseCase? signInUseCase})
      : _signInUseCase = signInUseCase ?? DefaultGoogleSignInUseCase();

  @override
  void initState({required LoadingStateProvider loadingProvider}) {
    loadingState = loadingProvider;
  }

  @override
  Future<Result<UserEntity, Failure>> signInWithGoogle() {
    return _signInUseCase.execute();
  }
}
