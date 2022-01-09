import 'package:cheetah/config/themes/light_theme.dart';
import 'package:cheetah/core/utils/general.dart';
import 'package:cheetah/modules/controllers/route_view_model.dart';
import 'package:cheetah/modules/controllers/theme_view_model.dart';
import 'package:cheetah/modules/controllers/user_view_model.dart';
import 'package:cheetah/view/screens/signin_screen.dart';
import 'package:cheetah/view/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';


class CheetahScaffold extends StatelessWidget {
  const CheetahScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeModeView theme = Provider.of<ThemeModeView>(context, listen: false);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserModelView>(create: (context)=>UserModelView()),
      ],
      child: SafeArea(
        top: false,
        child: GestureDetector(
          onTap: (){
            GeneralUtils.closeKeyboardWhenUnFocus(context);

            //theme.dark();   //Test amaçlı burada duruyor
          },
          child: Scaffold(
           // appBar: LoginSignInAppBar(),
            body: SingleChildScrollView(child: SignInScreen()),
            //floatingActionButton: FloatingActionButton(onPressed: (){}, child: const Icon(Icons.add),),
          ),
        ),
      ),
    );
  }
}
