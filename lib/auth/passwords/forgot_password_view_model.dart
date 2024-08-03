import 'package:move_on/auth/passwords/update_password_use_case.dart';

abstract class ForgotPasswordViewModelInput {
  late String email;
  Future<void> updatePassword();
}

abstract class ForgotPasswordViewModel extends ForgotPasswordViewModelInput {}

class DefaultForgotPasswordViewModel extends ForgotPasswordViewModel {
  final UpdatePassWordUseCase _updatePassWordUseCase;

  DefaultForgotPasswordViewModel({UpdatePassWordUseCase? updatePassWordUseCase})
      : _updatePassWordUseCase =
            updatePassWordUseCase ?? DefaultUpdatePasswordUseCase();
  @override
  Future<void> updatePassword() {
    return _updatePassWordUseCase.execute(email: email);
  }
}
