import 'package:flutter/material.dart';

import '../../core/themes/font_themes.dart';
import '../../core/values/colors.dart';

class SinglePlayHourBuilder extends StatelessWidget {
  const SinglePlayHourBuilder({
    Key? key,
    required this.number,
  }) : super(key: key);

  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: blue,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(8),
      child: Text(
        number,
        style: smallText.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
