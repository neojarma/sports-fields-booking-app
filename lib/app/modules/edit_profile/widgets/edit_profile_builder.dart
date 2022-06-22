import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/themes/font_themes.dart';
import '../../../core/values/colors.dart';
import '../../../global_widgets/custom_medium_button.dart';
import '../../../global_widgets/loading_spinkit.dart';
import '../controllers/edit_profile_controller.dart';
import 'build_circle_image.dart';
import 'edit_icon_circle_image.dart';
import 'edit_profile_text_field.dart';

class EditProfileBuilder extends GetView<EditProfileController> {
  const EditProfileBuilder({
    Key? key,
  }) : super(key: key);

  List<EditProfileTextField> buildEditProfileTextFields() {
    return [
      EditProfileTextField(
        controller: controller.nameController,
        label: 'Name',
      ),
      EditProfileTextField(
        controller: controller.addressController,
        label: 'Address',
      ),
      EditProfileTextField(
        controller: controller.phoneNumberController,
        label: 'Phone Number',
      ),
      EditProfileTextField(
        controller: controller.emailController,
        label: 'Email',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Stack(
            children: [
              Obx(() {
                if (controller.isImageChange.value) {
                  return CircleImage(
                    image: controller.temporaryImage.image,
                    onTap: controller.pickImage,
                  );
                }

                return CircleImage(
                  image:
                      Image.memory(base64Decode(controller.userProfile.image))
                          .image,
                  onTap: controller.pickImage,
                );
              }),
              const EditIconOnCircleImage(
                backgroundColor: blue,
                icon: Icons.edit,
                iconColor: Colors.white,
              ),
            ],
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
          ...buildEditProfileTextFields().map(
            (textField) => Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                textField,
              ],
            ),
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
    );
  }
}
