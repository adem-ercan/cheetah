import 'package:cheetah/core/widgets/blurry_alert_dialog.dart';
import 'package:cheetah/modules/controllers/component_state.dart';
import 'package:cheetah/modules/controllers/route_view_model.dart';
import 'package:cheetah/view/screens/profile_photo_setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePhotoDialog extends StatelessWidget {
  int? index;
  ProfilePhotoDialog({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ComponentState componentState = Provider.of<ComponentState>(context, listen: false);

    return BlurryAlertDialog(
      alertDialog: AlertDialog(
        backgroundColor: Colors.grey.shade700,
        title: Container(
          height: 150,
          width: 150,
          child: Hero(
            tag: index.toString(),
            child: GestureDetector(
                onTap: () {},
                child: FlutterLogo(
                  size: 50,
                )),
          ),
        ),
        actions: [
          Center(
            child: TextButton(
              child: Text(
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
