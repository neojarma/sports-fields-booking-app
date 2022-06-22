import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports_booking_app/app/modules/booking_field/widgets/selected_time_picker_builder.dart';
import 'package:sports_booking_app/app/modules/booking_field/widgets/unselected_time_picker_builder.dart';

import '../../../core/themes/font_themes.dart';
import '../../../core/values/colors.dart';
import '../controllers/booking_field_controller.dart';

class TimeRangePickerBuilder extends GetView<BookingFieldController> {
  const TimeRangePickerBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Time',
            style: mediumText.copyWith(color: blue),
          ),
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: Get.width / 6,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 12,
          itemBuilder: (context, index) {
            final workingHour = index + 8;
            return Obx(
              () => controller.temporaryHours.contains(workingHour)
                  ? SelectedTime(
                      hour: workingHour.toString(),
                      onTap: () => controller.handleUserTimePick(workingHour),
                    )
                  : UnselectedTime(
                      hour: workingHour.toString(),
                      onTap: () => controller.handleUserTimePick(workingHour),
                    ),
            );
          },
        ),
      ],
    );
  }
}
