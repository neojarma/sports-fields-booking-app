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
    Response<dynamic> req;
    try {
      var url = ApiProvider.updateUser;
      req = await getConnect.put(url, request.toJson());
      return UserResponse.fromJson(req.body);
    } catch (e) {
      throw Exception('Failed to update data');
    }
  }
}
