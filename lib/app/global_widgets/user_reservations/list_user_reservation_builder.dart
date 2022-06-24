import 'package:flutter/material.dart';

import '../../core/themes/font_themes.dart';
import '../../data/model/reservation/user_reservation_model.dart';
import 'subtitle_user_reservation_builder.dart';
import 'user_reservation_booking_date_builder.dart';
import 'user_reservation_footer_builder.dart';
import 'user_reservation_image_builder.dart';
import 'user_reservation_price_information.dart';
import 'user_reservation_schedule_builder.dart';
import '../../helper/format_date_from_epoch_time.dart';
import '../../helper/formatted_price.dart';

class ListUserReservationBuilder extends StatelessWidget {
  final List<UserReservation> reservations;
  final bool isUsingCustomActionButton;

  final void Function(String)? cancelFunction;
  final void Function(UserReservation)? editFunction;

  const ListUserReservationBuilder({
    Key? key,
    required this.reservations,
    required this.isUsingCustomActionButton,
    this.editFunction,
    this.cancelFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: reservations.length,
      itemBuilder: (context, index) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ExpansionTile(
            childrenPadding: const EdgeInsets.all(8),
            textColor: Colors.black,
            title: Text(
              'Booking Id:${reservations[index].transactionId}',
              style: smallText,
            ),
            subtitle: SubtitleUserReservationBuilder(
              secondText: 'Rp. ${getFormattedPrice(
                reservations[index].totalPrice,
              )}',
              firstText: reservations[index].venueName,
            ),
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserReservationImageBuilder(url: reservations[index].imageLink),
              const SizedBox(
                height: 8,
              ),
              UserReservationBookingDateBuilder(
                date: getformattedDateFromEpochTime(
                  reservations[index].bookingTime,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Price',
                style: textfieldText.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              UserReservationPriceInformation(
                price: 'Rp. ${getFormattedPrice(
                  reservations[index].pricePerHour,
                )}',
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Schedule',
                style: textfieldText.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              UserReservationScheduleBuilder(
                date: getformattedDateFromEpochTime(
                  reservations[index].playTime,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Play hours',
                style: textfieldText.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              UserReservationFooterBuilder(
                hours: reservations[index].hours,
                isUsingCustomActionButton: isUsingCustomActionButton,
                transactionId: reservations[index].transactionId,
                reservation: reservations[index],
                cancelFunction: cancelFunction,
                editFunction: editFunction,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
