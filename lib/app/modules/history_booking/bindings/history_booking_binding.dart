import 'package:get/get.dart';

import '../controllers/history_booking_controller.dart';

class HistoryBookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryBookingController>(
      () => HistoryBookingController(),
    );
  }
}
