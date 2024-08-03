import 'dart:convert';

class CollectionDecodable {
  final List<Collection>? collections;

  CollectionDecodable({required this.collections});

  factory CollectionDecodable.fromJson(String str) =>
      CollectionDecodable.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  factory CollectionDecodable.fromMap(Map<String, dynamic> json) =>
      CollectionDecodable(
        collections: json["collections"] == null
            ? null
            : List<Collection>.from(
                json["collections"].map((x) => Collection.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "collections": collections == null
            ? null
            : List<dynamic>.from(collections!.map((x) => x.toMap)),
      };
}

class Collection {
  final int id;
  final String img;
  final String name;

  Collection({
    required this.id,
    required this.img,
    required this.name,
  });

  factory Collection.fromJson(String str) =>
      Collection.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Collection.fromMap(Map<String, dynamic> json) => Collection(
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
