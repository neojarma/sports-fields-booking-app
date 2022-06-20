import 'package:get/get.dart';
import 'package:sports_booking_app/app/data/model/login/login_request.dart';
import 'package:sports_booking_app/app/data/model/login/login_response.dart';
import 'package:sports_booking_app/app/data/provider/api_provider.dart';

abstract class LoginRepository {
  static final getConnect = GetConnect();

  static Future<LoginResponse> login(LoginRequest request) async {
    Response<dynamic> req;
    try {
      req = await getConnect.post(ApiProvider.login, request.toJson());
    } catch (e) {
      throw Exception('Failed to send request');
    }

    return LoginResponse.fromJson(req.body);
  }
}
