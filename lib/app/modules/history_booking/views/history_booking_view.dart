import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/history_booking_controller.dart';

class HistoryBookingView extends GetView<HistoryBookingController> {
  const HistoryBookingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HistoryBookingView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HistoryBookingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
