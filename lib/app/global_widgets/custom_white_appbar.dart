import 'package:flutter/material.dart';

import '../core/themes/font_themes.dart';

AppBar customWhiteAppBar(String title) {
  return AppBar(
    toolbarHeight: 70,
    elevation: 0,
    foregroundColor: Colors.black,
    backgroundColor: Colors.transparent,
    title: Text(
      title,
      style: profileTextStyle,
    ),
    centerTitle: true,
  );
}
