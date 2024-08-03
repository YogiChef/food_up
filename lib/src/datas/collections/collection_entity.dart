import 'dart:convert';

class CollectionEntity {
  final List<CollectionDetailEntity>? collections;

  CollectionEntity({required this.collections});

  factory CollectionEntity.fromJson(String str) =>
      CollectionEntity.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  factory CollectionEntity.fromMap(Map<String, dynamic> json) =>
      CollectionEntity(
        collections: json["collections"] == null
            ? null
            : List<CollectionDetailEntity>.from(json["collections"]
                .map((x) => CollectionDetailEntity.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "collections": collections == null
            ? null
            : List<dynamic>.from(collections!.map((x) => x.toMap)),
      };
}

class CollectionDetailEntity {
  final int id;
  final String img;
  final String name;

  CollectionDetailEntity({
    required this.id,
    required this.img,
    required this.name,
  });

  factory CollectionDetailEntity.fromJson(String str) =>
      CollectionDetailEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CollectionDetailEntity.fromMap(Map<String, dynamic> json) =>
      CollectionDetailEntity(
        id: json["id"],
        img: json["img"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "img": img,
        "name": name,
      };
}
