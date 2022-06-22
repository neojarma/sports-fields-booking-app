import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports_booking_app/app/data/model/login/login_request.dart';
import 'package:sports_booking_app/app/data/service/login_service.dart';
import 'package:sports_booking_app/app/routes/app_pages.dart';

class LoginController extends GetxController with StateMixin {
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;

  @override
  void onInit() {
    intializeController();
    change(true, status: RxStatus.success());

    super.onInit();
  }

  void intializeController() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  void handleLogin() async {
    final inputtedUsername = usernameController.text;
    final inputtedPassword = passwordController.text;

    final loginRequest = LoginRequest(
      username: inputtedUsername,
      password: inputtedPassword,
    );

    change(false, status: RxStatus.loading());
    final isValid = await LoginService.login(loginRequest);
    change(true, status: RxStatus.success());

    if (isValid) {
      Get.offNamed(Routes.HOME, arguments: inputtedUsername);
      return;
    }

    Get.snackbar(
      'Login',
      'Invalid username or password',
    );
  }
}
