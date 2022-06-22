import 'package:get/get.dart';

import '../controllers/booking_field_controller.dart';

class BookingFieldBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookingFieldController>(
      () => BookingFieldController(),
    );
  }
}
