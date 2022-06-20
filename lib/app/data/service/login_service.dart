import 'package:sports_booking_app/app/data/model/login/login_request.dart';
import 'package:sports_booking_app/app/data/repository/login_repository.dart';

abstract class LoginService {
  static Future<bool> login(LoginRequest request) async {
    try {
      final result = await LoginRepository.login(request);
      if (result.code == 200) return true;
    } catch (e) {
      throw Exception(e);
    }
    return false;
  }
}
