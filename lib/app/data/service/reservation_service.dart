import 'package:sports_booking_app/app/data/repository/reservation_repository.dart';

import '../model/reservation/reservation_request.dart';
import '../model/reservation/reservation_response.dart';
import '../model/reservation/schedule_request.dart';

abstract class ReservationService {
  static Future<List<int>> getSchedule(ScheduleRequest request) async {
    return await ReservationRepository.getSchedule(request);
  }

  static Future<List<ReservationResponse>> getReservationListByUserId(
      String userId) async {
    return await ReservationRepository.getReservationListByUserId(userId);
  }

  static Future<void> cancelReservation(String idTransaction) async {
    ReservationRepository.cancelReservation(idTransaction);
  }

  static Future<void> createReservation(ReservationRequest request) async {
    ReservationRepository.createReservation(request);
  }

  static Future<void> updateReservation(ReservationRequest request) async {
    ReservationRepository.updateReservation(request);
  }
}
