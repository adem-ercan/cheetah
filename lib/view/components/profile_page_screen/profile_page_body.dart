import 'package:cheetah/modules/controllers/component_state.dart';
import 'package:cheetah/view/components/profile_page_screen/profile_photo_setting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePageBody extends StatelessWidget {
  static const List<double> _profilePhotoSize = [150, 150];
  static const EdgeInsets _profilePhotoPadding = EdgeInsets.only(top: 50);
  int? index;
  ProfilePageBody({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ComponentState _componentState =
        Provider.of<ComponentState>(context, listen: false);
    return Column(
      children: [
        GestureDetector(
          onTap: () => _componentState.showPPDialog(context, index),
          child: Padding(
            padding: _profilePhotoPadding,
            child: Center(
              child: Container(
                height: _profilePhotoSize[0],
                width: _profilePhotoSize[1],
                child: CircleAvatar(
                  child: Hero(
                      tag: index.toString(),
                      child: const FlutterLogo(
                        size: 50,
                      )),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

 
}
