import 'package:cheetah/view/components/register_text_form_field.dart';
import 'package:flutter/material.dart';


class ChatConsole extends StatelessWidget {
  const ChatConsole({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(

        children: [

          Expanded(
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.grey
              ),
              child: Row(
                children: [
              
                 IconButton(onPressed: (){}, icon: Icon(Icons.emoji_emotions, color: Colors.black,)),
                 Expanded(child: TextFormField()),
                IconButton(onPressed: (){}, icon: Icon(Icons.attach_file_rounded, color: Colors.black,)),
                IconButton(onPressed: (){}, icon: Icon(Icons.photo_camera, color: Colors.black,)),
                ],
              ),
            ),
          ),
          SizedBox(width: 20,),
          CircleAvatar(
            backgroundColor: Colors.purpleAccent,
            child: IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.mic), 
              color: Colors.pink,
              highlightColor: Colors.green, 
              splashColor: Colors.red,)),

        ],
      ),
    );
  }
}