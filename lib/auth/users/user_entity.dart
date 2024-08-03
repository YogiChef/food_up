import 'dart:convert';

class UserEntity {
  String? billingAddress;
  String? dateOfBirth;
  String? email;
  String? idToken;
  String? localId;
  String? phone;
  String? photo;
  String? role;
  String? shippingAddress;
  String? startDate;
  String? username;

  UserEntity({
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

  factory UserEntity.fromJson(String str) =>
      UserEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserEntity.fromMap(Map<String, dynamic> json) => UserEntity(
        billingAddress: json["billingAddress"],
        dateOfBirth: json["doteOfBirth"],
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
        "doteOfBirth": dateOfBirth,
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

enum UserRole { user, owner, admin, rider }

extension ParseToString on UserRole {
  String toshortString() {
    return toString().split('.').last;
  }
}