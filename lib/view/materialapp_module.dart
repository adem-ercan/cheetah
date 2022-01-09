import 'package:cheetah/config/themes/dark_theme.dart';
import 'package:cheetah/config/themes/light_theme.dart';
import 'package:cheetah/core/utils/general.dart';
import 'package:cheetah/modules/controllers/component_state.dart';
import 'package:cheetah/modules/controllers/route_view_model.dart';
import 'package:cheetah/modules/controllers/theme_view_model.dart';
import 'package:cheetah/modules/init.dart';
import 'package:cheetah/view/screens/intro_screen.dart';
import 'package:cheetah/view/screens/main_page_screen.dart';
import 'package:cheetah/view/splash_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheetahApp extends StatelessWidget {


  const CheetahApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeModeView>(create: (context)=>ThemeModeView()),
        ChangeNotifierProvider<RouteModel>(create: (context)=>RouteModel()),
        ChangeNotifierProvider<ComponentState>(create: (context)=>ComponentState()),

      ],
      child: FutureBuilder(
          future: Init.instance.initialize(),
          builder: (context, snapshot) {
            final themeData = Provider.of<ThemeModeView>(context, listen: true);

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const MaterialApp(
                debugShowCheckedModeBanner: false,
                  home: SplashScreen()
              );
            } else {

              return GestureDetector(
                onTap: (){
                  GeneralUtils.closeKeyboardWhenUnFocus(context);
                },
                child: MaterialApp(

                  debugShowCheckedModeBanner: false,
                  theme: (themeData.themeState != true)  ? DarkThemeData.init() : LightThemeData.init(),
                  home: const MainScreen(),
                ),
              );
            }
          }),
    );
  }
}
