import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class ColorSerializer implements JsonConverter<Color, dynamic> {
  const ColorSerializer();
  @override
  Color fromJson(dynamic colorName) {
    if (colorName != null) {
      colorName as String;
      List<String> colorParameters = colorName.replaceAll(" ", "").split(",");
      final colorInt = <int>[];
      for (var colorParam in colorParameters) {
        colorInt.add(int.parse(colorParam));
      }
      return Color.fromARGB(colorInt[0], colorInt[1], colorInt[2], colorInt[3]);
    } else {
      return Colors.blue;
    }
  }

  @override
  Color toJson(dynamic colorNama) => Colors.blue;
}
