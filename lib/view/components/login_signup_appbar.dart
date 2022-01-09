import 'package:flutter/material.dart';

class CheetahScaffoldAppBar extends AppBar {

  final String? titleAppBar;
  final Widget? leadingAppBar;
  final List<Widget>? actionAppBar;
  final bool? titleCenterAppBar;
  final ShapeBorder? shapeBorderAppBar;

  CheetahScaffoldAppBar({Key? key,
    this.titleAppBar,
    this.leadingAppBar,
    this.actionAppBar,
    this.titleCenterAppBar,
    this.shapeBorderAppBar
  }):super(key: key,
    title:  Text(titleAppBar ?? "",),
    leading: leadingAppBar,
    actions: actionAppBar,
    centerTitle: titleCenterAppBar,
  );
}

