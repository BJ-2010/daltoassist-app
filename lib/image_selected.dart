import 'dart:io';
import 'package:colourblindness_filter/main.dart';
import 'package:flutter/material.dart';
import 'package:colourblindness_filter/color_filter.dart';
import 'package:colourblindness_filter/color_identifier.dart';
import 'package:colourblindness_filter/color_theory.dart';
import 'package:flutter_image_filters/flutter_image_filters.dart';
import 'package:colourblindness_filter/home_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:colourblindness_filter/image_selected.dart';

class ImageSelector extends StatefulWidget {
  final File? file;
 const ImageSelector({super.key, required this.file});

  @override
  State<ImageSelector> createState() => _ImageSelectorState();
}

class _ImageSelectorState extends State<ImageSelector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: file != null
        ? Image.file(file!)
        : Text("No image selected"),

      ),
    );
  }
}