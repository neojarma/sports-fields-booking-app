import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sports_booking_app/app/core/themes/custom_snackbar_theme.dart';
import 'package:sports_booking_app/app/data/model/user/user_request.dart';
import 'package:sports_booking_app/app/data/model/user/user_response.dart';
import 'package:sports_booking_app/app/data/service/user_service.dart';

import '../../home/controllers/home_controller.dart';

class EditProfileController extends GetxController with StateMixin {
  late UserResponse userProfile;

  late Image temporaryImage;
  String temporaryImagePath = '';
  var isImageChange = false.obs;

  late final TextEditingController nameController;
  late final TextEditingController addressController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController emailController;

  @override
  void onInit() {
    initializeUserProfile();

    super.onInit();
  }

  void pickImage() async {
    isImageChange.value = false;
    var userImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (userImage == null) return;

    isImageChange.value = true;
    temporaryImagePath = userImage.path;
    File imageFile = File(temporaryImagePath);
    temporaryImage = Image.file(imageFile);

    refresh();
  }

  String getBase64FromImagePath() {
    final bytes = File(temporaryImagePath).readAsBytesSync();
    return base64Encode(bytes);
  }

  void handleEditProfile() async {
    change(false, status: RxStatus.loading());

    final name = nameController.text;
    final address = addressController.text;
    final phoneNumber = phoneNumberController.text;
    final email = emailController.text;
    final idUser = userProfile.idUser;
    final image =
        isImageChange.value ? getBase64FromImagePath() : userProfile.image;

    final request = UserRequest(
      idUser: idUser,
      name: name,
      address: address,
      phoneNumber: phoneNumber,
      email: email,
      image: image,
    );

    userProfile = await UserService.updateUser(request);

    CustomSnackbar.successSnackbar(
      title: 'Success',
      message: 'Success edit profile',
    );

    change(true, status: RxStatus.success());
  }

  void initalizeValueOfController() {
    temporaryImage = Image.memory(base64Decode(userProfile.image));
    nameController.value = TextEditingValue(text: userProfile.name);
    addressController.value = TextEditingValue(text: userProfile.address);
    phoneNumberController.value = TextEditingValue(
      text: userProfile.phoneNumber,
    );
    emailController.value = TextEditingValue(text: userProfile.email);
  }

  void initializeController() {
    nameController = TextEditingController();
    addressController = TextEditingController();
    phoneNumberController = TextEditingController();
    emailController = TextEditingController();
  }

  void initializeUserProfile() async {
    change(false, status: RxStatus.loading());

    final homeController = Get.find<HomeController>();
    userProfile = await UserService.getUser(homeController.username);

    initializeController();
    initalizeValueOfController();

    change(true, status: RxStatus.success());
  }
}
