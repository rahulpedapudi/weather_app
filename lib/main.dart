import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/weather_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final WeatherProvider weatherProvider = Provider.of<WeatherProvider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(title: Text("Weather Application")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/cloudy-sun.png', height: 300, width: 300),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                labelText: 'Enter a City Name',
                hintText: 'eg. Delhi',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _textController.clear();
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            FilledButton(
              child: Text("Get Weather"),
              onPressed: () {
                setState(() {
                  if (_textController.text.isNotEmpty) {
                    weatherProvider.updateCity(_textController.text);
                  }
                });
              },
            ),
            SizedBox(height: 20),
            Text(weatherProvider.weatherData),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: weatherProvider.fetchData,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
