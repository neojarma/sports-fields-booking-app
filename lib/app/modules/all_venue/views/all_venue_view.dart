import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/all_venue_controller.dart';

class AllVenueView extends GetView<AllVenueController> {
  const AllVenueView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AllVenueView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AllVenueView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
