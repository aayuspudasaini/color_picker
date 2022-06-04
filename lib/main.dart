import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Picker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: "Color Picker",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Map<String, Color> primaryColors = {
    'red': Colors.red,
    'blue': Colors.blue,
    'deepPurple': Colors.deepPurple,
    'deepOrange': Colors.deepOrange,
    'pink': Colors.pink,
    'teal': Colors.teal,
  };
  Color? selectedColors;
  void _setColor(String colorName, Color color) {
    setState(() {
      selectedColors = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        backgroundColor: selectedColors ?? Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var entry in primaryColors.entries)
            Container(
              width: double.infinity,
              height: size.height * 0.06,
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  _setColor(entry.key, entry.value);
                },
                child: null,
                style: ElevatedButton.styleFrom(
                  primary: entry.value,
                ),
              ),
            )
        ],
      ),
    );
  }
}
