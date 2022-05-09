import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:Container(
        child: Center(
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Page()));
            },
            child: CircleAvatar(
              child: FlutterLogo(),
            ),
          ),
        ),
      ),
      ),
    );
  }
}


class Page extends StatelessWidget {
  
  const Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("data"),),
      body: Center(
        child: FlutterLogo(
          size: 500,
        ),
      ),
    );
  }
}
