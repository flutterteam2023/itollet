import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

extension AppSnackbar on BuildContext {
  void snackbar(
    String content, {
    Color? backgroundColor,
    String? labelText,
    TextStyle? contentStyle,
    Color? labelTextColor,
  }) {
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor ?? Theme.of(this).colorScheme.primaryContainer,
        content: AutoSizeText(
          
          content,
          style: contentStyle ?? TextStyle(color: Theme.of(this).colorScheme.onPrimaryContainer),
          textScaleFactor: MediaQuery.of(this).textScaleFactor,
        ),
        action: SnackBarAction(
          label: labelText ?? 'kapat',
          textColor: labelTextColor ?? Theme.of(this).colorScheme.onPrimaryContainer,
          onPressed: () {
            ScaffoldMessenger.of(this).clearSnackBars();
            // Some code to undo the change.
          },
        ),
      ),
    );
  }
}
