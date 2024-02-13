import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AdsEditTextField extends StatelessWidget {
  const AdsEditTextField({
    super.key,
    required this.label,
    required this.onPressed, required this.controller,
  });
  
  final String label;
  final void Function() onPressed;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return TextField(
      controller: controller,
      cursorColor: const Color(0xff1D1B20),
      decoration: InputDecoration(
        label: AutoSizeText(label,
        textScaleFactor: textScaleFactor,
        ),

      ),
    );
  }
}
