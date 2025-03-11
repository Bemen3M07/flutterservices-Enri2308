import 'package:flutter/material.dart';
import 'package:Mi_App/Exercici_1/data/car_http_service.dart';
import 'package:Mi_App/Exercici_1/model/car_model.dart';


class CarProvider extends ChangeNotifier {
  final CarHttpService _carService = CarHttpService();
  List<CarsModel> _cars = [];
  bool _isLoading = false;

  List<CarsModel> get cars => _cars;
  bool get isLoading => _isLoading;

  Future<void> fetchCars() async {
    _isLoading = true;
    notifyListeners(); // Notifica a la UI

    _cars = await _carService.getCars();
    _isLoading = false;
    notifyListeners(); // Notifica a la UI
  }
}
