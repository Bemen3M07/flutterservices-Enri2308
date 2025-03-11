import 'dart:convert';

class JokeModel {
  final String setup;
  final String punchline;

  JokeModel({required this.setup, required this.punchline});

  factory JokeModel.fromMap(Map<String, dynamic> json) {
    return JokeModel(
      setup: json["setup"],
      punchline: json["punchline"],
    );
  }

  static List<JokeModel> fromJsonList(String str) {
    return List<JokeModel>.from(json.decode(str).map((x) => JokeModel.fromMap(x)));
  }
}
