import 'dart:convert';

class UserBodyParameters {
  final String? billingAddress;
  final String? doteOfBirth;
  final String? email;
  final String? idToken;
  final String? localId;
  final String? phone;
  final String? photo;
  final String? role;
  final String? shippingAddress;
  final String? startDate;
  final String? username;

  UserBodyParameters({
    required this.billingAddress,
    required this.doteOfBirth,
    required this.email,
    required this.idToken,
    required this.localId,
    required this.phone,
    required this.photo,
    required this.role,
    required this.shippingAddress,
    required this.startDate,
    required this.username,
  });

  factory UserBodyParameters.fromJson(String str) =>
      UserBodyParameters.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserBodyParameters.fromMap(Map<String, dynamic> json) =>
      UserBodyParameters(
        billingAddress: json["billingAddress"],
        doteOfBirth: json["doteOfBirth"],
        email: json["email"],
        idToken: json["idToken"],
        localId: json["localId"],
        phone: json["phone"],
        photo: json["photo"],
        role: json["role"],
        shippingAddress: json["shippingAddress"],
        startDate: json["startDate"],
        username: json["username"],
      );

  Map<String, dynamic> toMap() => {
        "billingAddress": billingAddress,
        "doteOfBirth": doteOfBirth,
        "email": email,
        "idToken": idToken,
        "localId": localId,
        "phone": phone,
        "photo": photo,
        "role": role,
        "shippingAddress": shippingAddress,
        "startDate": startDate,
        "username": username,
      };
}
