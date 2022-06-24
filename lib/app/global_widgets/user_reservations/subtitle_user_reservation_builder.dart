import 'package:flutter/material.dart';

import '../../core/themes/font_themes.dart';
import '../../core/values/colors.dart';

class SubtitleUserReservationBuilder extends StatelessWidget {
  const SubtitleUserReservationBuilder({
    Key? key,
    required this.firstText,
    required this.secondText,
  }) : super(key: key);

  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          firstText,
          style: textfieldText,
        ),
        Text(
          secondText,
          style: subtitle1.copyWith(color: blue, fontSize: 17),
        ),
      ],
    );
  }
}
