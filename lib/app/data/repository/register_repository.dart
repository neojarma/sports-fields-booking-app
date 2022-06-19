import 'package:get/get.dart';
import 'package:sports_booking_app/app/data/model/Register/register_response.dart';
import 'package:sports_booking_app/app/data/model/Register/register_request.dart';
import 'package:sports_booking_app/app/data/provider/api_provider.dart';

class RegisterRepository {
  static final getConnect = GetConnect();

  static Future<RegisterResponse> register(RegisterRequest request) async {
    final req = await getConnect.post(ApiProvider.register, request.toJson());
    final response = RegisterResponse.fromJson(req.body);

    return response;
  }
}
