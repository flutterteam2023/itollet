import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdsEditTextField extends StatelessWidget {
  const AdsEditTextField({
    super.key,
    required this.label,
    required this.onPressed,
  });
  final String label;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: const Color(0xff1D1B20),
      decoration: InputDecoration(
        label: Text(label),
      ),
    );
  }
}
