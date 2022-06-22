import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values/colors.dart';
import 'font_themes.dart';

abstract class CustomSnackbar {
  static void successSnackbar() {
    Get.rawSnackbar(
      messageText: Center(
        child: Text(
          'Update data successful!',
          style: subtitle1.copyWith(color: green, fontSize: 15),
        ),
      ),
      backgroundColor: softGreen,
      borderColor: green,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      borderRadius: 10,
    );
  }
}
