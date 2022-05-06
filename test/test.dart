import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(TestApp());
}

class TestApp extends StatefulWidget {
  TestApp({Key? key}) : super(key: key);

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  double containerHeight = 200;

  GlobalKey _formKey = GlobalKey<FormState>();

  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            color: Colors.green,
            child: Center(
              child:
               Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: controller,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.red,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow)),
                    ),
                    minLines: 1,
                    maxLines: 4,
                    onChanged: (e) {
                      setState(() {
                        debugPrint(_formKey.currentContext!.size!.height.toString());
                      });
                    },
                  ),
                )
            ),
          ),
        ),
      ),
    );
  }
}
