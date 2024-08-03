import 'dart:convert';

class SignUpEntity {
  final String kind;
  final String idToken;
  final String email;
  final String refreshToken;
  final String expiresIn;
  final String localId;

  SignUpEntity({
    required this.kind,
    required this.idToken,
    required this.email,
    required this.refreshToken,
    required this.expiresIn,
    required this.localId,
  });

  factory SignUpEntity.fromJson(String str) =>
      SignUpEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SignUpEntity.fromMap(Map<String, dynamic> json) => SignUpEntity(
        kind: json["kind"],
        idToken: json["idToken"],
        email: json["email"],
        refreshToken: json["refreshToken"],
        expiresIn: json["expiresIn"],
        localId: json["localId"],
      );

  Map<String, dynamic> toMap() => {
        "kind": kind,
        "idToken": idToken,
        "email": email,
        "refreshToken": refreshToken,
        "expiresIn": expiresIn,
        "localId": localId,
      };
}
