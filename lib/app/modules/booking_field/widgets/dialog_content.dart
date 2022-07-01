import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/themes/font_themes.dart';
import '../../../core/values/colors.dart';

class DialogContentModel {
  String venueName;
  String pricePerHour;
  String totalHour;
  String totalPrice;
  VoidCallback onConfirm;

  DialogContentModel({
    required this.venueName,
    required this.pricePerHour,
    required this.totalHour,
    required this.totalPrice,
    required this.onConfirm,
  });
}

void showOrderDialogSummary(DialogContentModel model) {
  Get.defaultDialog(
    title: 'Booking Summary',
    titleStyle: smallText.copyWith(color: orange),
    content: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            model.venueName,
            style: textfieldText.copyWith(fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Price: ',
                style: textfieldText.copyWith(fontSize: 15),
              ),
              Text(
                model.pricePerHour,
                style: smallText,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Hour: ',
                style: textfieldText.copyWith(fontSize: 15),
              ),
              Text(
                '${model.totalHour} hour',
                style: smallText,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Price: ',
                style: textfieldText.copyWith(fontSize: 15),
              ),
              Text(
                model.totalPrice,
                style: smallText,
              ),
            ],
          ),
        ],
      ),
    ),
    onConfirm: model.onConfirm,
    textConfirm: 'Book',
    textCancel: 'Cancel',
    confirmTextColor: Colors.white,
  );
}
