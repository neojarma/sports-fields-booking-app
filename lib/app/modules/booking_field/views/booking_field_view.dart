import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sports_booking_app/app/core/values/colors.dart';
import 'package:sports_booking_app/app/global_widgets/custom_white_appbar.dart';

import '../controllers/booking_field_controller.dart';
import '../widgets/date_range_picker_builder.dart';
import '../widgets/time_range_picker_builder.dart';

class BookingFieldView extends GetView<BookingFieldController> {
  const BookingFieldView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customWhiteAppBar(controller.infoVenue.idVenue),
      body: SmartRefresher(
        controller: controller.refreshController,
        onRefresh: () => controller.refreshSchedule(false),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DateRangePickerBuilder(
              calendarHeight: Get.height * 0.44,
              maxDate: controller.getMaxDateTimeCalendar(),
              minDate: controller.getCurrentDateTime(),
              onSelectionChanged: controller.handleUserDatePick,
              initialDate: controller.getCurrentDateTime(),
            ),
            const TimeRangePickerBuilder(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Booking Field'),
        icon: const Icon(Icons.add),
        backgroundColor: blue,
        onPressed: controller.handleSubmitBookingField,
      ),
    );
  }
}
