import 'package:cheetah/modules/controllers/component_state.dart';
import 'package:cheetah/modules/controllers/locator.dart';
import 'package:cheetah/modules/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePageBody extends StatelessWidget {
  static const List<double> _profilePhotoSize = [100, 100];
  static const EdgeInsets _profilePhotoPadding = EdgeInsets.only(top: 50);
  int index;
  ProfilePageBody({
    Key? key,
    required this.index,
  }) : super(key: key);

  Repository _repository = locator<Repository>();

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
              child: SizedBox(
                height: _profilePhotoSize[0],
                width: _profilePhotoSize[1],
                child: Hero(tag: index.toString(), 
                child: ClipOval(
                  child: Image.network(_repository
                  .userListFromInit[index]['profilePhotoURL'].toString()),
                )),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
                child: Text(
              _repository
                  .userListFromInit[index]['userName'].toString(),
              style: const TextStyle(fontSize: 24, color: Colors.blueGrey),
            )),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.settings_backup_restore_rounded,
                color: Colors.grey,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
                child: Text( _repository
                  .userListFromInit[index]['email'].toString() ??
              "Unknown",
              style: const TextStyle(fontSize: 20, color: Colors.blueGrey),
            )),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.settings_backup_restore_rounded,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ],
    );
  }
}
