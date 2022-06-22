import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values/colors.dart';

abstract class CustomSnackbar {
  static void successSnackbar(
      {required String title, required String message}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: green,
      duration: const Duration(seconds: 2),
      borderRadius: 10,
      margin: const EdgeInsets.all(10),
      icon: const Icon(
        Icons.check,
        color: Colors.white,
      ),
      colorText: Colors.white,
    );
  }

  static void failedSnackbar({
    required String title,
    required String message,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: red,
      duration: const Duration(seconds: 2),
      borderRadius: 10,
      margin: const EdgeInsets.all(10),
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ),
      colorText: Colors.white,
    );
  }
}
