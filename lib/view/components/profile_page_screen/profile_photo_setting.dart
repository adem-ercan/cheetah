import 'package:cheetah/core/widgets/blurry_alert_dialog.dart';
import 'package:cheetah/modules/controllers/component_state.dart';
import 'package:cheetah/modules/controllers/locator.dart';
import 'package:cheetah/modules/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePhotoDialog extends StatelessWidget {
  int index;
  ProfilePhotoDialog({
    Key? key,
    required this.index,
  }) : super(key: key);

  Repository _repository = locator<Repository>();

  @override
  Widget build(BuildContext context) {
    ComponentState componentState =
        Provider.of<ComponentState>(context, listen: false);

    return BlurryAlertDialog(
      alertDialog: AlertDialog(
        backgroundColor: Colors.grey.shade700,
        title: SizedBox(
          height: 150,
          width: 150,
          child: GestureDetector(
              onTap: () {},
              child: Hero(
                tag: index.toString(),
                child: Image.network(_repository
                .userListFromInit[index]['profilePhotoURL']),
              ),),
        ),
        actions: [
          Center(
            child: TextButton(
              child: const Text(
                "Settings",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () => componentState.goToPPScreen(context, index),
            ),
          )
        ],
      ),
    );
  }
}
