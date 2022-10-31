import 'package:cheetah/modules/models/error_catch_model.dart';
import 'package:cheetah/core/services/firebase_auth_service.dart';
import 'package:cheetah/core/services/firestore_service.dart';
import 'package:cheetah/modules/controllers/route_view_model.dart';
import 'package:cheetah/modules/init.dart';
import 'package:cheetah/modules/repositories/repository.dart';
import 'package:cheetah/view/screens/chat_page_screen.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.I;

void setupLocator() {
  locator.registerLazySingleton(() => Repository());
  locator.registerLazySingleton(() => FirebaseAuthX());
  locator.registerLazySingleton(() => RouteModel());
  locator.registerLazySingleton(() => FireStoreDB());
  locator.registerLazySingleton(() => CatchErrorService());
  locator.registerLazySingleton(() => Init.instance);
}
