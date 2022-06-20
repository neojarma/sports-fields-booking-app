import 'package:sports_booking_app/app/data/model/user/user_request.dart';
import 'package:sports_booking_app/app/data/model/user/user_response.dart';
import 'package:sports_booking_app/app/data/repository/user_repository.dart';

abstract class UserService {
  static Future<UserResponse> getUser(String username) async {
    try {
      return await UserRepository.getUser(username);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<UserResponse> updateUser(UserRequest request) async {
    try {
      return await UserRepository.updateUser(request);
    } catch (e) {
      throw Exception(e);
    }
  }
}
