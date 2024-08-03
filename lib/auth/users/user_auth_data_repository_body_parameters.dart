class GetUserDataBodyParameters {
  final String idToken;
  GetUserDataBodyParameters({
    required this.idToken,
  });

  Map<String, dynamic> toMap() => {
        'idToken': idToken,
      };
}
