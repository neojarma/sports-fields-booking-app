import 'package:get/get.dart';
import 'package:sports_booking_app/app/data/model/user/user_response.dart';
import 'package:sports_booking_app/app/data/service/user_service.dart';

class ProfileController extends GetxController with StateMixin {
  late final UserResponse userProfile;

  @override
  void onInit() {
    intializeUserProfile();

    super.onInit();
  }

  void intializeUserProfile() async {
    change(false, status: RxStatus.loading());
    userProfile = await UserService.getUser('acer');
    change(true, status: RxStatus.success());
  }
}
