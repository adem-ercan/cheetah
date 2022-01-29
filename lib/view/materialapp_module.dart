import 'package:cheetah/config/themes/dark_theme.dart';
import 'package:cheetah/config/themes/light_theme.dart';
import 'package:cheetah/core/utils/general.dart';
import 'package:cheetah/modules/controllers/component_state.dart';
import 'package:cheetah/modules/controllers/form_view_model.dart';
import 'package:cheetah/modules/controllers/route_view_model.dart';
import 'package:cheetah/modules/controllers/theme_view_model.dart';
import 'package:cheetah/modules/controllers/user_view_model.dart';
import 'package:cheetah/modules/init.dart';
import 'package:cheetah/modules/models/user_model.dart';
import 'package:cheetah/modules/repositories/contexts.dart';
import 'package:cheetah/view/screens/intro_screen.dart';
import 'package:cheetah/view/screens/landing_switch.dart';
import 'package:cheetah/view/screens/main_page_screen.dart';
import 'package:cheetah/view/screens/signin_screen.dart';
import 'package:cheetah/view/splash_scaffold.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        ChangeNotifierProvider<UserModelView>(create: (context)=>UserModelView()),
        ChangeNotifierProvider<FormViewModel>(create: (context)=>FormViewModel()),
        ChangeNotifierProvider<ContextRepository>(create: (context)=>ContextRepository()),
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
                child: StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.userChanges(),
                  builder: (context, snapshot) {
                    return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      theme: (themeData.themeState != false)  ? DarkThemeData.init() : LightThemeData.init(),
                      home: const LandingPage(),
                    );
                  }
                )
              );
            }
          }),
    );
  }
}

/*StreamBuilder<UserCheetah?>(
stream: userModelView.userCheetahChange(),
builder: (context, AsyncSnapshot<UserCheetah?> snapshotX) {
if(snapshotX.hasData){
if(snapshotX.connectionState==ConnectionState.done){
debugPrint("içerdeyiz gardaşşş "+snapshotX.data!.email.toString());
return MaterialApp(
debugShowCheckedModeBanner: false,
theme: (themeData.themeState != false)  ? DarkThemeData.init() : LightThemeData.init(),
home: MainScreen(),);
}else if(snapshotX.connectionState==ConnectionState.waiting){
return MaterialApp(
debugShowCheckedModeBanner: false,
theme: (themeData.themeState != false)  ? DarkThemeData.init() : LightThemeData.init(),
home: const IntroPage(),);
}else{
return MaterialApp(
debugShowCheckedModeBanner: false,
theme: (themeData.themeState != false)  ? DarkThemeData.init() : LightThemeData.init(),
home:  const IntroPage());
}


}else{
return MaterialApp(
debugShowCheckedModeBanner: false,
theme: (themeData.themeState != false)  ? DarkThemeData.init() : LightThemeData.init(),
home: SignInScreen(),);
}

}
)*/
