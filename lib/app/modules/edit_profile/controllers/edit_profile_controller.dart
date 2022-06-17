import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sports_booking_app/app/data/model/user/user_request.dart';
import 'package:sports_booking_app/app/data/model/user/user_response.dart';
import 'package:sports_booking_app/app/data/service/user_service.dart';

class EditProfileController extends GetxController with StateMixin {
  late UserResponse userProfile;

  late final TextEditingController nameController;
  late final TextEditingController addressController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController emailController;

  @override
  void onInit() {
    initializeUserProfile();

    super.onInit();
  }

  void handleEditProfile() async {
    change(false, status: RxStatus.loading());

    final name = nameController.text;
    final address = addressController.text;
    final phoneNumber = phoneNumberController.text;
    final email = emailController.text;
    final idUser = userProfile.idUser;
    final image = userProfile.image;

    final request = UserRequest(
      idUser: idUser,
      name: name,
      address: address,
      phoneNumber: phoneNumber,
      email: email,
      image: image,
    );

    // print(request.idUser);
    // print(request.name);
    // print(request.address);
    // print(request.phoneNumber);
    // print(request.email);
    // print(request.image);

    userProfile = await UserService.updateUser(request);

    change(true, status: RxStatus.success());
  }

  void initalizeValueOfController() {
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

    userProfile = await UserService.getUser('acer');

    initializeController();
    initalizeValueOfController();

    change(true, status: RxStatus.success());
  }
}
