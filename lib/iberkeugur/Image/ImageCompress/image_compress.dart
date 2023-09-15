// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';

Future<XFile?> compressFile(File file) async {
  final filePath = file.absolute.path;

  // Create output file path
  // eg:- "Volume/VM/abcd_out.jpeg"
  final lastIndex = filePath.lastIndexOf(RegExp('.jp'));
  final splitted = filePath.substring(0, lastIndex);
  final outPath = '${splitted}_out${filePath.substring(lastIndex)}';
  final result = await FlutterImageCompress.compressAndGetFile(
    file.absolute.path,
    outPath,
    quality: 20,
  );

  print(file.lengthSync());

  return result;
}
