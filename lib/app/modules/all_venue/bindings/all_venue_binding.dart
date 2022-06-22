import 'package:get/get.dart';

import '../controllers/all_venue_controller.dart';

class AllVenueBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllVenueController>(
      () => AllVenueController(),
    );
  }
}
