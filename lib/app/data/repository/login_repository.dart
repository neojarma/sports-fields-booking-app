import 'package:get/get.dart';
import 'package:sports_booking_app/app/data/model/login/login_request.dart';
import 'package:sports_booking_app/app/data/model/login/login_response.dart';
import 'package:sports_booking_app/app/data/provider/api_provider.dart';

class LoginRepository {
  static final getConnect = GetConnect();

  static Future<LoginResponse> login(LoginRequest request) async {
    final req = await getConnect.post(ApiProvider.login, request.toJson());
    return LoginResponse.fromJson(req.body);
  }
}
