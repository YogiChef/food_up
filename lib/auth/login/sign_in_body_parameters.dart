class SignInBodyParameters {
  final String email;
  final String password;
  SignInBodyParameters({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() => {
        'email': email,
        'password': password,
      };
}
