import 'dart:convert';

class UpdatePasswordDecodable {
  String? kind;
  String? email;

  UpdatePasswordDecodable({
    required this.kind,
    required this.email,
  });

  factory UpdatePasswordDecodable.fromJson(String str) => UpdatePasswordDecodable.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdatePasswordDecodable.fromMap(Map<String, dynamic> json) => UpdatePasswordDecodable(
    kind: json["kind"],
    email: json["email"],
  );

  Map<String, dynamic> toMap() => {
    "kind": kind,
    "email": email,
  };
}
