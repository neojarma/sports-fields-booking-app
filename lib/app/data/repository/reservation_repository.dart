import 'dart:developer';

import 'package:get/get.dart';
import 'package:sports_booking_app/app/data/model/reservation/reservation_response.dart';
import 'package:sports_booking_app/app/data/model/reservation/schedule_request.dart';
import 'package:sports_booking_app/app/data/provider/api_provider.dart';

import '../model/reservation/reservation_request.dart';

abstract class ReservationRepository {
  static final getConnect = GetConnect();

  static Future<List<int>> getSchedule(ScheduleRequest request) async {
    final url =
        '${ApiProvider.getSchedule}?venue=${request.venueId}&date=${request.date}';

    var req = await getConnect.get(url);

    return req.body['data'].cast<int>();
  }

  static Future<List<ReservationResponse>> getReservationListByUserId(
      String userId) async {
    final url = '${ApiProvider.getReservationById}$userId';

    final req = await getConnect.get(url);

    final data = req.body['data'] as List;

    return data.map((each) => ReservationResponse.fromJson(each)).toList();
  }

  static Future<void> cancelReservation(String idTransaction) async {
    try {
      final url = '${ApiProvider.cancelReservation}$idTransaction';

      await getConnect.delete(url);
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<void> createReservation(ReservationRequest request) async {
    try {
      const url = ApiProvider.createReservation;
      await getConnect.post(url, request.createReservationToJson());
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<void> updateReservation(ReservationRequest request) async {
    try {
      const url = ApiProvider.updateReservation;
      await getConnect.put(url, request.updateReservationToJson());
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<List<int>> getScheduleExcludeTxId(
      ScheduleRequest request) async {
    final url =
        '${ApiProvider.getScheduleExcludeTxId}?venue=${request.venueId}&date=${request.date}&txId=${request.txId}';

    var req = await getConnect.get(url);

    return req.body['data'].cast<int>();
  }
}
