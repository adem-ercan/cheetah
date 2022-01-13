import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: (){
          },
          child: const Text("TAMAM", style: TextStyle(fontSize: 32),),
        ),
      ),
    );
  }
}
