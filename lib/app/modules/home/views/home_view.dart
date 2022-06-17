import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sports_booking_app/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: ElevatedButton(
        onPressed: () => Get.toNamed(Routes.PROFILE),
        child: const Text(
          'profile',
        ),
      ),
    );
  }
}
