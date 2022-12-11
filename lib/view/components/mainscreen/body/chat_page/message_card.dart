import 'package:cheetah/modules/controllers/locator.dart';
import 'package:cheetah/modules/repositories/repository.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  int index;
  late bool _amI;

  MessageCard({Key? key, required this.index}) : super(key: key);

  Repository _repository = locator<Repository>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Card(
        elevation: 24,
        margin: const EdgeInsets.all(5),
        color: Colors.blueGrey,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
              "Deneme Mehmet KARAHANLI sdfasdfasdfasfafadsfafasfadfasdfdsfasdfasdf adsfasdf asdfa sdf sdfasdfasdfasdfasfasdfadfasdfasdfsdafasdfasdfadsfasfasfaf"),
        ),
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.deepPurple, width: 2),
            borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
