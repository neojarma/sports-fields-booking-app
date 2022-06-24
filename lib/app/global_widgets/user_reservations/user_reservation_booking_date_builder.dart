import 'package:flutter/material.dart';

import '../../core/themes/font_themes.dart';

class UserReservationBookingDateBuilder extends StatelessWidget {
  const UserReservationBookingDateBuilder({
    Key? key,
    required this.date,
  }) : super(key: key);

  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Booking',
          style: textfieldText.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        const Icon(
          Icons.arrow_forward,
          size: 17,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          date,
          style: smallText,
        )
      ],
    );
  }
}
