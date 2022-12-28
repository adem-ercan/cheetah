import 'package:cheetah/modules/controllers/component_state.dart';
import 'package:cheetah/modules/controllers/locator.dart';
import 'package:cheetah/modules/controllers/route_view_model.dart';
import 'package:cheetah/modules/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessageCard extends StatelessWidget {
  // ignore: unused_field
  String index;
  String messageContent = "";
  late bool _amI;

  MessageCard({Key? key, required this.index, required this.messageContent})
      : super(key: key);

  Repository _repository = locator<Repository>();

  @override
  Widget build(BuildContext context) {
    ComponentState _componentState =
        Provider.of<ComponentState>(context, listen: true);
    RouteModel _routeModel = Provider.of<RouteModel>(context, listen: true);
    
    return Align(
      alignment: Alignment.centerRight,
      child: Card(
        elevation: 24,
        margin: const EdgeInsets.all(5),
        color: Colors.blueGrey,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(" " + messageContent),
        ),
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.deepPurple, width: 2),
            borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
