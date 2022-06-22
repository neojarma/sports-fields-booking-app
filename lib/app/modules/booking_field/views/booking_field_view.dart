import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/booking_field_controller.dart';

class BookingFieldView extends GetView<BookingFieldController> {
  const BookingFieldView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookingFieldView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'BookingFieldView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
