import 'package:flutter/widgets.dart';
import 'package:weather_app/weather_service.dart';

class WeatherProvider with ChangeNotifier {
  final WeatherService _weatherService = WeatherService();
  String cityName = "London";
  String weatherData = "Fetching Data...";

  WeatherProvider() {
    fetchData();
  }

  Future<void> fetchData() async {
    weatherData = await _weatherService.fetchData(cityName);
    notifyListeners();
  }

  void updateCity(city) {
    cityName = city;
    fetchData();
  }
}
