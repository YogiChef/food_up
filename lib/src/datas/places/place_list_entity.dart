import 'dart:convert';

class PlaceListEntity {
  List<PlaceDetailEntity>? placeList;

  PlaceListEntity({required this.placeList});

  factory PlaceListEntity.fromJson(String str) =>
      PlaceListEntity.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  factory PlaceListEntity.fromMap(Map<String, dynamic> json) => PlaceListEntity(
        placeList: json["placeList"] == null
            ? null
            : List<PlaceDetailEntity>.from(
                json["placeList"].map((x) => PlaceDetailEntity.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "placeList": placeList == null
            ? null
            : List<dynamic>.from(placeList!.map((x) => x.toMap)),
      };
}

class PlaceDetailEntity {
  final String address;
  final String adminId;
  final String city;
  final int collectionId;
  final String country;
  final String description;
  final String email;
  final List<String>? favourites;
  final List<String>? imgs;
  final double lat;
  final double long;
  final String phoneNumber;
  final String placeId;
  final String placeName;
  final int ratings;
  final double ratingAverage;
  final String zipCode;
  final String status;
  final bool isPopularThisWeek;
  final bool isNovelty;
  final bool hasFreeDelivery;
  final bool hasAlcohol;
  final bool isOpenNow;
  final int averagePrice;

  PlaceDetailEntity({
    required this.address,
    required this.adminId,
    required this.city,
    required this.collectionId,
    required this.country,
    required this.description,
    required this.email,
    required this.favourites,
    required this.imgs,
    required this.lat,
    required this.long,
    required this.phoneNumber,
    required this.placeId,
    required this.placeName,
    required this.ratings,
    required this.ratingAverage,
    required this.zipCode,
    required this.status,
    required this.isPopularThisWeek,
    required this.isNovelty,
    required this.hasFreeDelivery,
    required this.hasAlcohol,
    required this.isOpenNow,
    required this.averagePrice,
  });

  factory PlaceDetailEntity.fromJson(String str) =>
      PlaceDetailEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PlaceDetailEntity.fromMap(Map<String, dynamic> json) =>
      PlaceDetailEntity(
        address: json["address"] ?? '',
        adminId: json["adminId"] ?? '',
        city: json["city"] ?? '',
        collectionId: json["collectionId"] ?? 0,
        country: json["country"] ?? '',
        description: json["description"] ?? '',
        email: json["email"] ?? '',
        favourites: json["favourites"] == null
            ? []
            : List<String>.from(json["favourites"].map((x) => x)),
        imgs: json["imgs"] == null
            ? []
            : List<String>.from(json["imgs"].map((x) => x)),
        lat: json["lat"]?.toDouble() ?? 0,
        long: json["long"]?.toDouble() ?? 0,
        phoneNumber: json["phoneNumber"] ?? '',
        placeId: json["placeId"] ?? '',
        placeName: json["placeName"] ?? '',
        ratings: json["ratings"] ?? 0,
        ratingAverage: json["ratingAverage"]?.toDouble() ?? 0,
        zipCode: json["zipCode"] ?? '',
        status: json["status"] ?? '',
        isPopularThisWeek: json["isPopularThisWeek"] ?? false,
        isNovelty: json["isNovelty"] ?? false,
        hasFreeDelivery: json["hasFreeDelivery"] ?? false,
        hasAlcohol: json["hasAlcohol"] ?? false,
        isOpenNow: json["isOpenNow"] ?? false,
        averagePrice: json["averagePrice"] ?? 0,
      );

  Map<String, dynamic> toMap() => {
        "address": address,
        "adminId": adminId,
        "city": city,
        "collectionId": collectionId,
        "country": country,
        "description": description,
        "email": email,
        "favourites": List<dynamic>.from(favourites!.map((x) => x)),
        "imgs": List<dynamic>.from(imgs!.map((x) => x)),
        "lat": lat,
        "long": long,
        "phoneNumber": phoneNumber,
        "placeId": placeId,
        "placeName": placeName,
        "ratings": ratings,
        "ratingAverage": ratingAverage,
        "zipCode": zipCode,
        "status": status,
        "isPopularThisWeek": isPopularThisWeek,
        "isNovelty": isNovelty,
        "hasFreeDelivery": hasFreeDelivery,
        "hasAlcohol": hasAlcohol,
        "isOpenNow": isOpenNow,
        "averagePrice": averagePrice,
      };

  bool isUserFavourite({required String? userUid}) {
    return favourites?.contains(userUid) ?? false;
  }
}
