import 'dart:io';
import 'package:flutter/material.dart';
import 'package:colourblindness_filter/color_filter.dart';
import 'package:colourblindness_filter/color_identifier.dart';
import 'package:colourblindness_filter/color_theory.dart';
import 'package:flutter_image_filters/flutter_image_filters.dart';
import 'package:colourblindness_filter/home_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:colourblindness_filter/image_selected.dart';


class StartPage extends StatefulWidget {
  final File? file; 
  const StartPage({super.key, required this.file});
  

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to DaltoAssist!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'This app aids people with colour blindess',
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
  
 // this shows different types of colorblindness the user can select    
class ColorFilterPage extends StatefulWidget {
  const ColorFilterPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
                  'images/sample_photo.jpg',
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