// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'package:flutter/material.dart';

enum Spaces {
  ///size 4
  XS,

  ///size 8
  S,

  ///size 12
  M,

  ///size 18
  L,

  ///size 24
  XL,

  ///size 36
  XLL,
}

extension DoubleValue on Spaces {
  double get size {
    switch (this) {
      case Spaces.XS:
        return 4;
      case Spaces.S:
        return 8;
      case Spaces.M:
        return 12;
      case Spaces.L:
        return 18;
      case Spaces.XL:
        return 24;
      case Spaces.XLL:
        return 36;
    }
  }
}

extension HeightSizeBoxWidget on Spaces {
  ///returned [SizedBox] height Spaces Value XS, S, M, L, XL, XXL
  SizedBox get height {
    switch (this) {
      case Spaces.XS:
        return const SizedBox(height: 4);
      case Spaces.S:
        return const SizedBox(height: 8);
      case Spaces.M:
        return const SizedBox(height: 12);
      case Spaces.L:
        return const SizedBox(height: 18);
      case Spaces.XL:
        return const SizedBox(height: 24);
      case Spaces.XLL:
        return const SizedBox(height: 36);
    }
  }
}

extension WidthSizeBoxWidget on Spaces {
  SizedBox get width {
    switch (this) {
      case Spaces.XS:
        return const SizedBox(width: 4);
      case Spaces.S:
        return const SizedBox(width: 8);
      case Spaces.M:
        return const SizedBox(width: 12);
      case Spaces.L:
        return const SizedBox(width: 18);
      case Spaces.XL:
        return const SizedBox(width: 24);
      case Spaces.XLL:
        return const SizedBox(width: 36);
    }
  }
}
