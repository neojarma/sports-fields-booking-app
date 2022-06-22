import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports_booking_app/app/data/model/user/user_response.dart';

import '../../../data/service/user_service.dart';
import '../../active_booking/views/active_booking_view.dart';
import '../../all_venue/views/all_venue_view.dart';
import '../../history_booking/views/history_booking_view.dart';
import '../../profile/views/profile_view.dart';

class HomeController extends GetxController {
  final String username = Get.arguments;
  UserResponse? dataUser;

  var pageIndex = 0.obs;
  var pageController = PageController(initialPage: 0);
  var bySlide = false.obs;

  @override
  void onInit() {
    getDataUser();

    super.onInit();
  }

  void getDataUser() async {
    dataUser = await UserService.getUser(username);
  }

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
