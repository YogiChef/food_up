class EmailValidate {
  static String message = 'Please enter your email addres';
  static String? validatEmail({required String email}) {
    String pattern =
        r'^([a-zA-Z0-9]+)([\-\_\.]*)([a-zA-Z0-9]*)([@])([a-zA-Z0-9]{2,})([\.][a-zA-Z0-9]{2,3})$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(email) ? null : message;
  }
}

class PasswordValidate {
  static String message = 'Please enter your password';
  static String? validatePassword({required String password}) {
    return password.isNotEmpty && password.length >= 6 ? null : message;
  }
}

class DefaultValidate {
  static String message = 'Passwords longer than 8 characters';
  static String? validateNotEmpty({required String value}) {
    return value.isNotEmpty ? null : message;
  }
}
