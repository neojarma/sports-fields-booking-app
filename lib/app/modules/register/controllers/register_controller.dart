import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports_booking_app/app/data/model/Register/register_request.dart';
import 'package:sports_booking_app/app/data/service/register_service.dart';
import 'package:sports_booking_app/app/routes/app_pages.dart';

class RegisterController extends GetxController with StateMixin {
  late final TextEditingController fullNameController;
  late final TextEditingController addressController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController emailController;
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;

  @override
  void onInit() {
    initializeController();

    change(true, status: RxStatus.success());

    super.onInit();
  }

  void initializeController() {
    fullNameController = TextEditingController();
    addressController = TextEditingController();
    phoneNumberController = TextEditingController();
    emailController = TextEditingController();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  void handleRegister() async {
    final name = fullNameController.text;
    final address = addressController.text;
    final phoneNumber = phoneNumberController.text;
    final email = emailController.text;
    final username = usernameController.text;
    final password = passwordController.text;

    final request = RegisterRequest(
      name: name,
      address: address,
      phoneNumber: phoneNumber,
      email: email,
      username: username,
      password: password,
    );

    change(false, status: RxStatus.loading());
    final isSuccess = await RegisterService.register(request);
    change(true, status: RxStatus.success());

    if (isSuccess) {
      Get.offNamed(Routes.LOGIN);
      return;
    }

    Get.snackbar('Register', 'Username already exist');
  }
}
