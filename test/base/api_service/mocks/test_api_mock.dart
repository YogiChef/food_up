import 'dart:convert';

class CorrectPostBodyParams {
  final String title;
  final String body;
  final int userId;

  CorrectPostBodyParams({
    required this.title,
    required this.body,
    required this.userId,
  });

  factory CorrectPostBodyParams.fromJson(String str) =>
      CorrectPostBodyParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CorrectPostBodyParams.fromMap(Map<String, dynamic> json) =>
      CorrectPostBodyParams(
        title: json["title"],
        body: json["body"],
        userId: json["userId"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "body": body,
        "userId": userId,
      };
}

class CorrectPutBodyParams {
  final int id;
  final String title;
  final String body;
  final int userId;

  CorrectPutBodyParams({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
  });

  factory CorrectPutBodyParams.fromJson(String str) =>
      CorrectPutBodyParams.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CorrectPutBodyParams.fromMap(Map<String, dynamic> json) =>
      CorrectPutBodyParams(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        userId: json["userId"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "body": body,
        "userId": userId,
      };
}
