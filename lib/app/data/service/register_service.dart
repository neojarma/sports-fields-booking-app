import 'package:sports_booking_app/app/data/model/Register/register_request.dart';
import 'package:sports_booking_app/app/data/repository/register_repository.dart';

class RegisterService {
  static Future<bool> register(RegisterRequest request) async {
    final result = await RegisterRepository.register(request);
    if (result.code == 200) return true;

    return false;
  }
}
