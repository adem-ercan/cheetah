import 'dart:ui';
import 'package:cheetah/modules/controllers/locator.dart';
import 'package:cheetah/modules/controllers/route_view_model.dart';
import 'package:cheetah/modules/controllers/user_view_model.dart';
import 'package:cheetah/modules/init.dart';
import 'package:cheetah/view/components/gradient_button.dart';
import 'package:cheetah/view/screens/landing_switch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroPage extends StatefulWidget {
  IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  //late NavigatorState _navigator;
  Init _init = locator<Init>();

   /* @override
  void initState() {
    _navigator = Navigator.of(context);
    super.initState();
  }

@override
  void didChangeDependencies() {
    _navigator = Navigator.of(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _navigator.pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>LandingPage()), (Route<dynamic> route) => true);
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    final route = Provider.of<RouteModel>(context, listen: false);
    final UserModelView userModelView =
        Provider.of<UserModelView>(context, listen: true);

    return WillPopScope(
      onWillPop: () async {
        /*showDialog(
            context: context,
            builder: (BuildContext context) {
              return BlurryDialog("Exit", "Are you sure you want to exit the application?",
                      (){
                    SystemNavigator.pop();
                  },  "Yes", "No");
            });*/
        return false;
      },
      child: Scaffold(
          body: Stack(
              alignment: Alignment.bottomCenter,
              fit: StackFit.expand,
              children: <Widget>[
            Image.asset("assets/images/cheetah_wp.jpg",
                fit: BoxFit.cover, alignment: Alignment.bottomCenter),
            ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 40),
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black, Colors.black.withOpacity(0)],
                        stops: const [0.2, 0.75]).createShader(rect);
                  },
                  blendMode: BlendMode.dstOut,
                  child: Image.asset("assets/images/dark_grey.jpg",
                      fit: BoxFit.cover, alignment: Alignment.bottomCenter),
                )
                ),
                
            Positioned(
                bottom: 150,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    "Are you ready for \na different experience?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 24,
                      letterSpacing: 2,
                    ),
                  ),
                )),
            Positioned(
              bottom: 50,
              child: Center(
                child: SizedBox(
                  child: GradientRaisedButton(
                      buttonText: "Let's get started!",
                      letterSpace: 2,
                      func: () async {
                        //Buradaki fonksiyonlar view model de birleştirilecek
                        userModelView.waitingState = WaitingState.busy;
                        SharedPreferences preferences =
                            await SharedPreferences.getInstance();
                        await preferences.setBool("isFirstLaunch", false);

                        await _init.firstLaunchSet();
                        await _init.initialize();
                        userModelView.waitingState = WaitingState.notBusy;

                        route.goToLandingScreen(context);
                        print("Rapçilere sada heyy!");
                      }
                      ),

                  /*ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xff171717),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60.0),
                              side: const BorderSide(
                                  color: Color(0xff212121),
                                  width: 1,
                                  style: BorderStyle.solid)),
                        ),
                        child: const Text("Let's get started!",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18, letterSpacing: 1.4),
                        ),

                        onPressed: () {
                          route.goToLoginScreen(context);
                        },
                      ),*/
                ),
              ),
            ),
          ])),
    );
  }
}
