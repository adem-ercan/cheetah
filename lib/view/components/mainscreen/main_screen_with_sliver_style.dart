import 'package:flutter/material.dart';

class CheetahSliverStyleBody extends StatelessWidget {
  const CheetahSliverStyleBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
           const SliverAppBar(
             expandedHeight: 120,
              pinned: true,
              snap: true,
            floating: true,
            actions: [
               Center(child: Text("Cheetah", style: TextStyle(fontSize: 24),)),
               SizedBox(width: 100,), 
              Icon(Icons.search_outlined),
              SizedBox(width: 20,),
              Icon(Icons.bookmark_outline_sharp)
        
            ],
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.message)),
                  Tab(icon: Icon(Icons.call)),
                  Tab(icon: Icon(Icons.share)),                  
                ],
              ),
            ),
          ];
        },
        body:  TabBarView(
          children: [
            CustomScrollView(
              slivers: [
               SliverList(delegate: SliverChildBuilderDelegate(
                 (BuildContext context, int index){
                   return Container(
                     
                  height: 80.0,
                  child: Row(
                    children: [
                      SizedBox(width: 5,),
                      CircleAvatar(
                        backgroundColor: index%2==0 ? Colors.deepOrange : Colors.brown,
                        child: FlutterLogo(),
                      ),
                       SizedBox(width: 15,),
                      Column( 
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text("Adem ERCAN"),
                              SizedBox(width: 150,),
                              Container(alignment: Alignment.centerRight,child: Text("14.03.2022"),)
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Icon(Icons.check_circle_outlined, color: index%2==0 ? Colors.green : Colors.grey,),
                              SizedBox(width: 5,),
                              Text("Naber lan kıraolar nasılsınız bakalım?", style:TextStyle(color: Colors.blueGrey)),
                            ],
                          )
                          
                        ],
                      ),
                      
                    ],
                  )
                );
                 }
               ))
              ],
            ),
            Icon(Icons.accessibility_new_rounded),
            Icon(Icons.share),            
          ],
        ),
      ),
    );
  }
}
