import 'package:flutter/material.dart';

import '../core/themes/font_themes.dart';

AppBar customWhiteAppBar() {
  return AppBar(
    toolbarHeight: 70,
    elevation: 0,
    foregroundColor: Colors.black,
    backgroundColor: Colors.white,
    title: Text(
      'My Profile',
      style: profileTextStyle,
    ),
    centerTitle: true,
  );
}
