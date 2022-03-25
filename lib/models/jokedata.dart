// To parse this JSON data, do
//
//     final jokeData = jokeDataFromJson(jsonString);

import 'dart:convert';

JokeData jokeDataFromJson(String str) => JokeData.fromJson(json.decode(str));

String jokeDataToJson(JokeData data) => json.encode(data.toJson());

class JokeData {
  JokeData({
    required this.error,
    required this.category,
    required this.type,
    required this.setup,
    required this.delivery,
    required this.flags,
    required this.id,
    required this.safe,
    required this.lang,
  });

  bool error;
  String category;
  String type;
  String setup;
  String delivery;
  Flags flags;
  int id;
  bool safe;
  String lang;

  factory JokeData.fromJson(Map<String, dynamic> json) => JokeData(
        error: json["error"],
        category: json["category"],
        type: json["type"],
        setup: json["setup"],
        delivery: json["delivery"],
        flags: Flags.fromJson(json["flags"]),
        id: json["id"],
        safe: json["safe"],
        lang: json["lang"],
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "category": category,
        "type": type,
        "setup": setup,
        "delivery": delivery,
        "flags": flags.toJson(),
        "id": id,
        "safe": safe,
        "lang": lang,
      };
}

class Flags {
  Flags({
    required this.nsfw,
    required this.religious,
    required this.political,
    required this.racist,
    required this.sexist,
    required this.explicit,
  });

  bool nsfw;
  bool religious;
  bool political;
  bool racist;
  bool sexist;
  bool explicit;

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        nsfw: json["nsfw"],
        religious: json["religious"],
        political: json["political"],
        racist: json["racist"],
        sexist: json["sexist"],
        explicit: json["explicit"],
      );

  Map<String, dynamic> toJson() => {
        "nsfw": nsfw,
        "religious": religious,
        "political": political,
        "racist": racist,
        "sexist": sexist,
        "explicit": explicit,
      };
}
