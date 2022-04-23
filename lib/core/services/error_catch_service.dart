import 'package:flutter/material.dart';

class CatchErrorService extends ChangeNotifier {
  String errorText;
  String? errorCode;

  CatchErrorService({
    required this.errorText,
    this.errorCode,
    });
}
