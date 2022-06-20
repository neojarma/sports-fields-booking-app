import 'package:get/get.dart';
import 'package:sports_booking_app/app/data/model/Register/register_response.dart';
import 'package:sports_booking_app/app/data/model/Register/register_request.dart';
import 'package:sports_booking_app/app/data/provider/api_provider.dart';

abstract class RegisterRepository {
  static final getConnect = GetConnect();

  static Future<RegisterResponse> register(RegisterRequest request) async {
    Response<dynamic> req;

    try {
      req = await getConnect.post(ApiProvider.register, request.toJson());
      return RegisterResponse.fromJson(req.body);
    } catch (e) {
      throw Exception('Failed to send request');
    }
  }
}
