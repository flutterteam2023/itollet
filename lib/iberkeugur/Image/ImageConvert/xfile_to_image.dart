import 'package:flutter/material.dart' show Image, ImageProvider;
import 'package:image_picker/image_picker.dart' show XFile;

Future<ImageProvider<Object>> xFileToImage(XFile xFile) async {
  final bytes = await xFile.readAsBytes();
  return Image.memory(bytes).image;
}
