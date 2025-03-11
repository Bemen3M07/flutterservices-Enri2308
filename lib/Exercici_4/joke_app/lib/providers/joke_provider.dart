import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:joke_app/models/joke_model.dart';
import 'dart:math';

class JokeProvider with ChangeNotifier {
  JokeModel? _currentJoke;
  bool _isLoading = false;

  JokeModel? get currentJoke => _currentJoke;
  bool get isLoading => _isLoading;

  Future<void> fetchRandomJoke() async {
    _isLoading = true;
    notifyListeners();

    final url = "https://api.sampleapis.com/jokes/goodJokes";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jokes = JokeModel.fromJsonList(response.body);
      final randomIndex = Random().nextInt(jokes.length);
      _currentJoke = jokes[randomIndex];
    } else {
      _currentJoke = null;
    }

    _isLoading = false;
    notifyListeners();
  }
}
