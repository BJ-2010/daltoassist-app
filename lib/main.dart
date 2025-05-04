import 'dart:io';
import 'package:flutter/material.dart';
import 'package:colourblindness_filter/color_filter.dart';
import 'package:colourblindness_filter/color_identifier.dart';
import 'package:colourblindness_filter/color_theory.dart';
import 'package:flutter_image_filters/flutter_image_filters.dart';
import 'package:colourblindness_filter/home_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:colourblindness_filter/image_selected.dart';
File? file; 
String colorBlindnessType = "";


void main() {
  runApp(ColorBlindFilterApp()); //hi
}

class ColorBlindFilterApp extends StatelessWidget {
  const ColorBlindFilterApp({super.key});

// Theme data
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Colorblind Filter',
      debugShowCheckedModeBanner: false,
      // APP THEME AND COLOURS HERE!!!
      theme: ThemeData(
        primarySwatch: Colors.blue,
        
        appBarTheme: AppBarTheme(
          color: const Color.fromARGB(255, 0, 69, 125),
          titleTextStyle:TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 92, 181, 255)
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style:ButtonStyle(
            backgroundColor: WidgetStateProperty.all(const Color.fromARGB(255, 92, 181, 255)),
            foregroundColor: WidgetStateProperty.all(Colors.white),
          )
        )
      ),
      home: const RootPage(),
    );
  }
}
// this page sets up nav bars and app bar and the body of it is any page selected through the nav buttons 
class RootPage extends StatefulWidget {
  const RootPage ({super.key});

  @override
  State<RootPage > createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  File? file;
  int currentPage = 0;
 
  List<Widget> pages(File? file) => [
    StartPage(file: file),
    ColourFilter(file: file),
    ColorTheory(file: file),
    ColorIdentifier(file: file),
    ImageSelector(file: file),
];  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // top bar for aesthetic - has app name
      appBar: AppBar(
        title: Text('DaltoAssist'),
      ),
  // bar with all buttons that have main app functions
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.camera), label: 'Color Filtering'),
          NavigationDestination(icon: Icon(Icons.color_lens), label: 'Color Identifier'),
          NavigationDestination(icon: Icon(Icons.book_sharp), label: 'Learn Color Theory'),
        ],
        onDestinationSelected: (int index){
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage, // cannot be index, should be var; SELECTS BUTTON
      ),
      body: pages(file)[currentPage],

    // button that lets user attach an image
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final picker = ImagePicker();
          final XFile? result = await picker.pickImage(source: ImageSource.gallery);
          if (result != null) {
      setState(() => file = File(result.path));
      // ignore: avoid_print
      print("Selected file path: ${file?.path}");
          }
          

             
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
