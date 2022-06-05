import 'package:cheetah/core/widgets/blurry_alert_dialog.dart';
import 'package:flutter/material.dart';

class ProfilePhotoDialog extends StatelessWidget {
  const ProfilePhotoDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlurryAlertDialog(
      alertDialog: AlertDialog(
        title: Text("deneme")
      ),
    );
  }
}
