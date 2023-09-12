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
      style: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: const Color(0xff1D1B20),
          fontSize: 16.sp,
          fontWeight: FontWeight.w400),
      decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: onPressed, icon: const Icon(Icons.cancel_outlined)),
          focusColor: const Color(0xff1D1B20),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff1D1B20))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff1D1B20))),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff1D1B20))),
          label: Text(
            label,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                fontFamily: 'Roboto',
                color: const Color(0xff1D1B20)),
          )),
    );
  }
}
