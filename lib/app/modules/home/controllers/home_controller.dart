import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../active_booking/views/active_booking_view.dart';
import '../../all_venue/views/all_venue_view.dart';
import '../../history_booking/views/history_booking_view.dart';
import '../../profile/views/profile_view.dart';

class HomeController extends GetxController {
  final String username = Get.arguments;

  var pageIndex = 0.obs;
  var pageController = PageController(initialPage: 0);
  var bySlide = false.obs;

  List<Widget> pages = [
    const AllVenueView(),
    const ActiveBookingView(),
    const HistoryBookingView(),
    const ProfileView(),
  ];

  void changePageBySlide(int index) {
    pageIndex.value = index;
  }

  void changePage(int index) {
    pageController.animateToPage(
      index,
      curve: Curves.decelerate,
      duration: const Duration(milliseconds: 170),
    );
    pageIndex.value = index;
  }
}
