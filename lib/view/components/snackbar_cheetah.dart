import 'package:flutter/material.dart';

class CheetahSnackBar {
  static SnackBar build(String label, String actionLabel, Function() actionOnPress) {
    return SnackBar(
      content: Text(label),
      action: SnackBarAction(
        label: actionLabel,
        onPressed: actionOnPress,
      ),
      );
  }
}
