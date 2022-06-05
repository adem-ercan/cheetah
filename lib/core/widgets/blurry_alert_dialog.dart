import 'dart:ui';

import 'package:flutter/material.dart';

class BlurryAlertDialog extends StatelessWidget {
  double? sigmaX, sigmaY;
  AlertDialog? alertDialog;
  BlendMode? blendMode;

  BlurryAlertDialog({
    Key? key,
    this.sigmaX,
    this.sigmaY,
    required this.alertDialog,
    this.blendMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: sigmaX ?? 5, sigmaY: sigmaY ?? 5),
      child: alertDialog,
      blendMode: blendMode ?? BlendMode.srcOver,
    );
  }
}
