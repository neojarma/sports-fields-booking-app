import 'package:flutter/material.dart';
import 'package:sports_booking_app/app/global_widgets/user_reservations/single_play_hour_builder.dart';

import '../../core/values/colors.dart';
import '../../data/model/reservation/user_reservation_model.dart';
import '../../modules/active_booking/widgets/custom_action_button.dart';

class UserReservationFooterBuilder extends StatelessWidget {
  const UserReservationFooterBuilder({
    Key? key,
    required this.hours,
    required this.reservation,
    required this.isUsingCustomActionButton,
    this.editFunction,
    this.cancelFunction,
    required this.transactionId,
  }) : super(key: key);

  final List<int> hours;
  final bool isUsingCustomActionButton;
  final void Function(String)? cancelFunction;
  final void Function(UserReservation)? editFunction;
  final String transactionId;
  final UserReservation reservation;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ...hours
              .map(
                (playHour) => SinglePlayHourBuilder(
                  number: playHour.toString(),
                ),
              )
              .toList(),
          const Spacer(
            flex: 1,
          ),
          isUsingCustomActionButton
              ? Row(
                  children: [
                    CustomActionButton(
                      backgroundColor: green,
                      borderColor: Colors.transparent,
                      label: 'Edit',
                      onTap: () => editFunction!(
                        reservation,
                      ),
                      textColor: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomActionButton(
                      backgroundColor: red,
                      borderColor: Colors.transparent,
                      label: 'Cancel',
                      onTap: () => cancelFunction!(transactionId),
                      textColor: Colors.white,
                    ),
                  ],
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
