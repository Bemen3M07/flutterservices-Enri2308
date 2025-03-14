import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:api_provider_app/models/car_model.dart';

class CarProvider with ChangeNotifier {
  List<CarModel> _cars = [];
  bool _isLoading = false;

  List<CarModel> get cars => _cars;
  bool get isLoading => _isLoading;

  Future<void> fetchCars() async {
    _isLoading = true;
    notifyListeners();

    final String url = "https://car-data.p.rapidapi.com/cars?limit=10&page=0";
    final response = await http.get(
      Uri.parse(url),
      headers: {
        "x-rapidapi-key": "6500c7126dmsh921a2abebf58478p1fd9f0jsn16ce086d3e04",
        "x-rapidapi-host": "car-data.p.rapidapi.com",
      },
    );

    if (response.statusCode == 200) {
      _cars = CarModel.fromJsonList(response.body);
    } else {
      _cars = [];
    }

    _isLoading = false;
    notifyListeners();
  }
}
