import 'package:cheetah/view/splash_scaffold.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.I;

void setupLocator(){
  locator.registerLazySingleton(() => const SplashScreen());
}
