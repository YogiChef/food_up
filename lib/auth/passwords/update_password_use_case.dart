// ignore_for_file: prefer_final_fields

import 'package:move_on/auth/passwords/update_password_repository.dart';
import 'package:move_on/src/base/sirvices/realtime_database_service/services/interfaces.dart';

abstract class UpdatePassWordUseCase {
  Future<void> execute({required String email});
}

class DefaultUpdatePasswordUseCase extends UpdatePassWordUseCase {
  UpdatePasswordRepository _updatePasswordRepository;

  DefaultUpdatePasswordUseCase(
      {UpdatePasswordRepository? updatePasswordRepository})
      : _updatePasswordRepository =
            updatePasswordRepository ?? DefaultUpdatePasswordRepository();
  @override
  Future<void> execute({required String email}) {
    return _updatePasswordRepository.updatePassword(email: email);
  }
}
