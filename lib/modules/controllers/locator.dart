import 'package:cheetah/core/services/firebase_auth_service.dart';
import 'package:cheetah/modules/repositories/repository.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.I;

void setupLocator(){
  locator.registerLazySingleton(() => Repository());
  locator.registerLazySingleton(() => FirebaseAuthX());
}
