import 'dart:convert';

class UserAuthDataDecodable {
  String? kind;
  List<User>? users;

  UserAuthDataDecodable({
    required this.kind,
    required this.users,
  });

  factory UserAuthDataDecodable.fromJson(String str) =>
      UserAuthDataDecodable.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserAuthDataDecodable.fromMap(Map<String, dynamic> json) =>
      UserAuthDataDecodable(
        kind: json["kind"],
        users: List<User>.from(json["users"].map((x) => User.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "kind": kind,
        "users": List<dynamic>.from(users!.map((x) => x.toMap())),
      };
}

class User {
  String localId;
  String email;
  bool emailVerified;
  String displayName;
  List<ProviderUserInfo> providerUserInfo;
  String photoUrl;
  String passwordHash;
  int passwordUpdatedAt;
  String validSince;
  bool disabled;
  String lastLoginAt;
  String createdAt;
  bool customAuth;

  User({
    required this.localId,
    required this.email,
    required this.emailVerified,
    required this.displayName,
    required this.providerUserInfo,
    required this.photoUrl,
    required this.passwordHash,
    required this.passwordUpdatedAt,
    required this.validSince,
    required this.disabled,
    required this.lastLoginAt,
    required this.createdAt,
    required this.customAuth,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        localId: json["localId"],
        email: json["email"],
        emailVerified: json["emailVerified"],
        displayName: json["displayName"],
        providerUserInfo: List<ProviderUserInfo>.from(
            json["providerUserInfo"].map((x) => ProviderUserInfo.fromMap(x))),
        photoUrl: json["photoUrl"],
        passwordHash: json["passwordHash"],
        passwordUpdatedAt: json["passwordUpdatedAt"],
        validSince: json["validSince"],
        disabled: json["disabled"],
        lastLoginAt: json["lastLoginAt"],
        createdAt: json["createdAt"],
        customAuth: json["customAuth"],
      );

  Map<String, dynamic> toMap() => {
        "localId": localId,
        "email": email,
        "emailVerified": emailVerified,
        "displayName": displayName,
        "providerUserInfo":
            List<dynamic>.from(providerUserInfo.map((x) => x.toMap())),
        "photoUrl": photoUrl,
        "passwordHash": passwordHash,
        "passwordUpdatedAt": passwordUpdatedAt,
        "validSince": validSince,
        "disabled": disabled,
        "lastLoginAt": lastLoginAt,
        "createdAt": createdAt,
        "customAuth": customAuth,
      };
}

class ProviderUserInfo {
  String providerId;
  String displayName;
  String photoUrl;
  String federatedId;
  String email;
  String rawId;
  String screenName;

  ProviderUserInfo({
    required this.providerId,
    required this.displayName,
    required this.photoUrl,
    required this.federatedId,
    required this.email,
    required this.rawId,
    required this.screenName,
  });

  factory ProviderUserInfo.fromJson(String str) =>
      ProviderUserInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProviderUserInfo.fromMap(Map<String, dynamic> json) =>
      ProviderUserInfo(
        providerId: json["providerId"],
        displayName: json["displayName"],
        photoUrl: json["photoUrl"],
        federatedId: json["federatedId"],
        email: json["email"],
        rawId: json["rawId"],
        screenName: json["screenName"],
      );

  Map<String, dynamic> toMap() => {
        "providerId": providerId,
        "displayName": displayName,
        "photoUrl": photoUrl,
        "federatedId": federatedId,
        "email": email,
        "rawId": rawId,
        "screenName": screenName,
      };
}
