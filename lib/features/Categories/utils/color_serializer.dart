import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class ColorSerializer implements JsonConverter<Color, dynamic> {
  const ColorSerializer();
  @override
  Color fromJson(dynamic colorName) {
    if (colorName != null) {
      assert(colorName.runtimeType == String, "toJson value is not Color runtimetype");
      colorName as String;
      List<String> colorParameters = colorName.replaceAll(" ", "").split(",");
      final colorInt = <int>[];
      for (var colorParam in colorParameters) {
        colorInt.add(int.parse(colorParam));
      }
      assert(colorInt.length == 4, "Incoming color data parameters length is lower than 4");
      return Color.fromARGB(colorInt[0], colorInt[1], colorInt[2], colorInt[3]);
    } else {
      return Colors.blue;
    }
  }

  @override
  String toJson(dynamic color) {
    assert(color.runtimeType == Color, "toJson value is not Color runtimetype");
    color as Color;
    return "${color.alpha}, ${color.red}, ${color.green}, ${color.blue}";
  }
}
