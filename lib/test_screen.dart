import 'package:cheetah/core/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuthX a = FirebaseAuthX();
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: (){
            a.createUserWithEmailAndPassword();
          },
          child: const Text("TAMAM", style: TextStyle(fontSize: 32),),
        ),
      ),
    );
  }
}
