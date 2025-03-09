import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
  String data = "";
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Weather Application")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                labelText: 'Enter a City Name',
                hintText: 'eg. Delhi',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    textController.clear();
                    setState(() {
                      data = "";
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            FilledButton(
              onPressed: () {
                setState(() {
                  data = textController.text;
                });
              },
              child: Text("Submit"),
            ),
            SizedBox(height: 20),
            Text(data),
          ],
        ),
      ),
    );
  }
}
