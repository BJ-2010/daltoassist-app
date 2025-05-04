import 'dart:io';
import 'package:flutter/material.dart';
import 'package:colourblindness_filter/color_filter.dart';
import 'package:colourblindness_filter/color_identifier.dart';
import 'package:colourblindness_filter/color_theory.dart';
import 'package:flutter_image_filters/flutter_image_filters.dart';
import 'package:colourblindness_filter/home_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:colourblindness_filter/image_selected.dart';
class ColorTheory extends StatefulWidget {
  final File? file; 
  const ColorTheory({super.key, required this.file});

  @override
  State<ColorTheory> createState() => _ColorTheoryState();
}

class _ColorTheoryState extends State<ColorTheory> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}