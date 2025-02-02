import 'dart:convert';

class UpdatePasswordBodyParameters {
  final String requestType;
  final String email;

  UpdatePasswordBodyParameters({
    required this.requestType,
    required this.email,
  });

  factory UpdatePasswordBodyParameters.fromJson(String str) => UpdatePasswordBodyParameters.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdatePasswordBodyParameters.fromMap(Map<String, dynamic> json) => UpdatePasswordBodyParameters(
    requestType: json["requestType"],
    email: json["email"],
  );

  Map<String, dynamic> toMap() => {
    "requestType": requestType,
    "email": email,
  };
}
