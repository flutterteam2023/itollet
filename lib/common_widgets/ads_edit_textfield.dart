import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AdsEditTextField extends StatelessWidget {
  const AdsEditTextField({
    super.key,
    required this.label,
    required this.onPressed,
    required this.controller,
    this.minLines = 1,
    this.maxLines = 5,
    this.borderRadius = 999,
    this.contentPadding = const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
  });

  final String label;
  final void Function() onPressed;
  final TextEditingController controller;
  final int minLines;
  final int maxLines;
  final double borderRadius;
  final EdgeInsetsGeometry contentPadding;

  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return TextField(
      controller: controller,
      cursorColor: const Color(0xff1D1B20),
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius)),
        label: AutoSizeText(
          label,
          textScaleFactor: textScaleFactor,
        ),
      ),
    );
  }
}
