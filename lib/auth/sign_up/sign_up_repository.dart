class SignUpRepositoryParameters {
  final String email;
  final String password;

  SignUpRepositoryParameters({required this.email, required this.password});

  Map<String, dynamic> toMap() => {
        "email": email,
        "password": password,
      };
}
