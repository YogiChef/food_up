import 'dart:convert';

import 'package:move_on/auth/users/user_entity.dart';

class SaveUserDataUseCaseParameters {
  String? billingAddress;
  String? dateOfBirth;
  String? email;
  String? idToken;
  String? localId;
  String? phone;
  String? photo;
  UserRole? role;
  String? shippingAddress;
  String? startDate;
  String? username;

  SaveUserDataUseCaseParameters({
    this.billingAddress,
    this.dateOfBirth,
    this.email,
    this.idToken,
    this.localId,
    this.phone,
    this.photo,
    this.role,
    this.shippingAddress,
    this.startDate,
    this.username,
  });

  factory SaveUserDataUseCaseParameters.fromJson(String str) =>
      SaveUserDataUseCaseParameters.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SaveUserDataUseCaseParameters.fromMap(Map<String, dynamic> json) =>
      SaveUserDataUseCaseParameters(
        billingAddress: json["billingAddress"],
        dateOfBirth: json["dateOfBirth"],
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
        "dateOfBirth": dateOfBirth,
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
