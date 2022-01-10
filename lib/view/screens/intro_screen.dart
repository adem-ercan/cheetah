import 'dart:ui';
import 'package:cheetah/modules/controllers/route_view_model.dart';
import 'package:cheetah/view/components/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final route = Provider.of<RouteModel>(context, listen: false);

    return WillPopScope(
      onWillPop: ()async{
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
                Image.asset(
                    "assets/images/cheetah_wp.jpg",
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomCenter),
                ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 40),
                    child: ShaderMask(
                      shaderCallback: (rect) {
                        return LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black, Colors.black.withOpacity(0)],
                            stops: [0.2, 0.75]).createShader(rect);
                      },
                      blendMode: BlendMode.dstOut,
                      child: Image.asset(
                          "assets/images/dark_grey.jpg",
                          fit: BoxFit.cover,
                          alignment: Alignment.bottomCenter),
                    )
                ),
                Positioned(
                    bottom: 150,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text("Are you ready for \na different experience?",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 24, letterSpacing: 2,),),
                    )),

                Positioned(
                  bottom: 50,
                  child: Center(
                    child: SizedBox(

                      child: GradientRaisedButton(
                        buttonText: "Let's get started!",
                        letterSpace: 2,
                        func: ()=>route.goToLoginScreen(context),
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
              ])
      ),
    );
  }
}