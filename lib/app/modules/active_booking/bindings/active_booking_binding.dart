import 'package:get/get.dart';

import '../controllers/active_booking_controller.dart';

class ActiveBookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActiveBookingController>(
      () => ActiveBookingController(),
    );
  }
}
