import 'package:get/get_connect/connect.dart';
import 'package:sports_booking_app/app/data/model/user/user_request.dart';

import '../model/user/user_response.dart';
import '../provider/api_provider.dart';

abstract class UserRepository {
  static final getConnect = GetConnect();

  static Future<UserResponse> getUser(String username) async {
    Response<dynamic> req;
    try {
      req = await getConnect.get('${ApiProvider.getDetailUser}$username');
      final data = req.body['data'];

      return UserResponse.fromJson(data);
    } catch (e) {
      throw Exception('Failed to fetch data');
    }
  }

  static Future<UserResponse> updateUser(UserRequest request) async {
    try {
      var url = ApiProvider.updateUser;
      final req = await getConnect.put(url, request.toJson());
      return UserResponse.fromJson(req.body['data']);
    } catch (e) {
      throw Exception('Failed to update data');
    }
  }
}
