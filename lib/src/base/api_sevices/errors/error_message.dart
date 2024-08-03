abstract class FailureMessages {
  static String unExpectedErrorMessage = 'Ha occurride un error inesperado';
}

abstract class FBFailureMessages {
  static String emailNotFoundMessage =
      'There is no user record corresponding to this identifier. The user may have been deleted.';
  static String invalidPasswordMessage =
      'The password is invalid or the user does not have a password.';
  static String emailExisMessage =
      'The email address is already in use by another account.';
  static String tooManyAttemptsMessage =
      'We have blocked all requests from this device due to unusual activity. Try again later.';
  static String invalidIdTokenMessage =
      'La credencial del usuario ya no es valida. El usuario debe iniciar sesion nuevamente.';

  static String userNotFoundMessage =
      'The user corresponding to the refresh token was not found. It is likely the user was deleted.';
}
