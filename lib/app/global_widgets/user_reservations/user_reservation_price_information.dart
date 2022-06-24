import 'package:flutter/material.dart';

import '../../core/themes/font_themes.dart';
import '../../core/values/colors.dart';

class UserReservationPriceInformation extends StatelessWidget {
  const UserReservationPriceInformation({
    Key? key,
    required this.price,
  }) : super(key: key);

  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          price,
          style: subtitle1.copyWith(color: blue, fontSize: 20),
        ),
        Text(
          '/hour',
          style: smallText.copyWith(fontSize: 10),
        )
      ],
    );
  }
}
