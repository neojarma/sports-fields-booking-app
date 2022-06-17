import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sports_booking_app/app/core/values/colors.dart';
import 'package:sports_booking_app/app/global_widgets/custom_medium_button.dart';
import 'package:sports_booking_app/app/global_widgets/loading_spinkit.dart';

import '../../../core/themes/font_themes.dart';
import '../../../global_widgets/custom_white_appbar.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customWhiteAppBar(),
      body: controller.obx(
        (state) => SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 10),
              CircleAvatar(
                radius: 100,
                backgroundImage: Image.memory(
                  base64Decode(controller.userProfile.image),
                ).image,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                controller.userProfile.name,
                style: profileTextStyle,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                controller.userProfile.email,
                style: subtitleProfileTextStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              EditProfileTextField(
                controller: controller.nameController,
                label: 'Full Name',
              ),
              const SizedBox(
                height: 20,
              ),
              EditProfileTextField(
                controller: controller.addressController,
                label: 'Address',
              ),
              const SizedBox(
                height: 20,
              ),
              EditProfileTextField(
                controller: controller.phoneNumberController,
                label: 'Phone Number',
              ),
              const SizedBox(
                height: 20,
              ),
              EditProfileTextField(
                controller: controller.emailController,
                label: 'Email',
              ),
              const SizedBox(
                height: 40,
              ),
              CustomMediumButton(
                label: 'Submit Changes',
                onTap: controller.handleEditProfile,
                color: blue,
              ),
              SizedBox(
                child: controller.obx(
                  (state) => const SizedBox.shrink(),
                  onLoading: const LoadingSpinkit(),
                ),
              )
            ],
          ),
        ),
        onLoading: const LoadingSpinkit(),
      ),
    );
  }
}

class EditProfileTextField extends StatelessWidget {
  const EditProfileTextField({
    Key? key,
    required this.label,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(label),
      ),
    );
  }
}
