import 'package:cheetah/core/services/hive_service.dart';
import 'package:cheetah/modules/controllers/locator.dart';
import 'package:cheetah/view/materialapp_module.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  
  setupLocator();

  runApp(const CheetahApp());
}
