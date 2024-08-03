import 'dart:convert';

class SignUpDecodable {
  final String kind;
  final String idToken;
  final String email;
  final String refreshToken;
  final String expiresIn;
  final String localId;

  SignUpDecodable({
    required this.kind,
    required this.idToken,
    required this.email,
    required this.refreshToken,
    required this.expiresIn,
    required this.localId,
  });

  factory SignUpDecodable.fromJson(String str) =>
      SignUpDecodable.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SignUpDecodable.fromMap(Map<String, dynamic> json) => SignUpDecodable(
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
