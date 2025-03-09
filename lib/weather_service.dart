import 'package:http/http.dart' as http;

class WeatherService {
  static const String baseUrl = "http://10.0.2.2:5000/weather/";

  Future<String> fetchData(String cityName) async {
    final response = await http.get(Uri.parse("$baseUrl$cityName"));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "Error: ${response.statusCode}";
    }
  }
}
