import 'dart:convert';

class ErrorDecodable {
  final ErrorDecodableError error;

  ErrorDecodable({
    required this.error,
  });

  factory ErrorDecodable.fromJson(String str) =>
      ErrorDecodable.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ErrorDecodable.fromMap(Map<String, dynamic> json) => ErrorDecodable(
        error: ErrorDecodableError.fromMap(json["error"]),
      );

  Map<String, dynamic> toMap() => {
        "error": error.toMap(),
      };
}

class ErrorDecodableError {
  final int code;
  final String message;
  final List<ErrorElement> errors;

  ErrorDecodableError({
    required this.code,
    required this.message,
    required this.errors,
  });

  factory ErrorDecodableError.fromJson(String str) =>
      ErrorDecodableError.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ErrorDecodableError.fromMap(Map<String, dynamic> json) =>
      ErrorDecodableError(
        code: json["code"],
        message: json["message"],
        errors: List<ErrorElement>.from(
            json["errors"].map((x) => ErrorElement.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "errors": List<dynamic>.from(errors.map((x) => x.toMap())),
      };
}

class ErrorElement {
  final String message;
  final String domain;
  final String reason;

  ErrorElement({
    required this.message,
    required this.domain,
    required this.reason,
  });

  factory ErrorElement.fromJson(String str) =>
      ErrorElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ErrorElement.fromMap(Map<String, dynamic> json) => ErrorElement(
        message: json["message"],
        domain: json["domain"],
        reason: json["reason"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "domain": domain,
        "reason": reason,
      };
}
