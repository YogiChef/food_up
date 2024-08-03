class SignUpUseCaseParameters {
  String username;
  String email;
  String password;
  String? phone;
  String? date;

  SignUpUseCaseParameters({
    required this.username,
    required this.email,
    required this.password,
    this.phone,
    this.date,
  });
}
