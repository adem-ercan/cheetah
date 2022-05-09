import 'package:cheetah/view/components/mainscreen/main_screen_drawer.dart';
import 'package:cheetah/view/components/mainscreen/main_screen_with_sliver_style.dart';
import 'package:flutter/material.dart';



class MainScreen extends StatelessWidget {
 const MainScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return  SafeArea(
        child: Scaffold(
            drawer: const CheetahMainScreenDrawer(),
            body: const CheetahSliverStyleBody(),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: FloatingActionButton(heroTag: "adem2",onPressed: (){}, child: const Icon(Icons.chat),),
         
         ),
        
    );
  }



  
}
