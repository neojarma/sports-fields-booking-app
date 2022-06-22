import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/active_booking_controller.dart';

class ActiveBookingView extends GetView<ActiveBookingController> {
  const ActiveBookingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ActiveBookingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ActiveBookingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
