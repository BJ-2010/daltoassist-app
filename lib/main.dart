import 'package:flutter/material.dart';

void main() {
  runApp(ColorBlindFilterApp());
}

class ColorBlindFilterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Colorblind Filter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InfoPage(),
    );
  }
}

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Colorblind Filter App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Colorblind Filter App!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'This app helps simulate how people with color blindness perceive colors.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ColorFilterPage()),
                );
              },
              child: Text('I know my type'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Test button, does not work yet
              },
              child: Text('Take a Test (Coming Soon)'),
            ),
          ],
        ),
      ),
    );
  }
}

class ColorFilterPage extends StatefulWidget {
  @override
  _ColorFilterPageState createState() => _ColorFilterPageState();
}

class _ColorFilterPageState extends State<ColorFilterPage> {
  ColorFilter _selectedFilter = ColorFilter.matrix(_normalMatrix);

  static const List<double> _normalMatrix = [
    1, 0, 0, 0, 0, //
    0, 1, 0, 0, 0, //
    0, 0, 1, 0, 0, //
    0, 0, 0, 1, 0, //
  ];

  static const List<double> _protanopiaMatrix = [
    0.567, 0.433, 0, 0, 0,
    0.558, 0.442, 0, 0, 0,
    0, 0.242, 0.758, 0, 0,
    0, 0, 0, 1, 0,
  ];

  static const List<double> _deuteranopiaMatrix = [
    0.625, 0.375, 0, 0, 0,
    0.7, 0.3, 0, 0, 0,
    0, 0.3, 0.7, 0, 0,
    0, 0, 0, 1, 0,
  ];

  static const List<double> _tritanopiaMatrix = [
    0.95, 0.05, 0, 0, 0,
    0, 0.433, 0.567, 0, 0,
    0, 0.475, 0.525, 0, 0,
    0, 0, 0, 1, 0,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Filter'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: ColorFiltered(
                colorFilter: _selectedFilter,
                child: Image.asset(
                  'assets/sample_photo.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedFilter = ColorFilter.matrix(_protanopiaMatrix);
                    });
                  },
                  child: Text('Protanopia'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedFilter = ColorFilter.matrix(_deuteranopiaMatrix);
                    });
                  },
                  child: Text('Deuteranopia'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedFilter = ColorFilter.matrix(_tritanopiaMatrix);
                    });
                  },
                  child: Text('Tritanopia'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedFilter = ColorFilter.matrix(_normalMatrix);
                    });
                  },
                  child: Text('Normal View'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
