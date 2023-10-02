import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return TextField(
      controller: controller,
      cursorColor: const Color(0xff1D1B20),
      decoration: InputDecoration(
        label: Text(label),
      ),
    );
  }
}
