import 'package:sports_booking_app/app/data/model/login/login_request.dart';
import 'package:sports_booking_app/app/data/repository/login_repository.dart';

class LoginService {
  static Future<bool> login(LoginRequest request) async {
    final result = await LoginRepository.login(request);
    if (result.code == 200) return true;

    return false;
  }
}
