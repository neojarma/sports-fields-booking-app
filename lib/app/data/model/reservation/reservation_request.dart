class ReservationRequest {
  final String? idTransaction;
  final String? venueId;
  final String? userId;
  final int beginTime;
  final int endTime;
  final List<int> hours;

  ReservationRequest({
    this.idTransaction,
    this.venueId,
    this.userId,
    required this.beginTime,
    required this.endTime,
    required this.hours,
  });

  Map<String, dynamic> updateReservationToJson() {
    return {
      'idTransaction': idTransaction,
      'beginTime': beginTime,
      'endTime': endTime,
      'hours': hours,
    };
  }

  Map<String, dynamic> createReservationToJson() {
    return {
      'venueId': venueId,
      'userId': userId,
      'beginTime': beginTime,
      'endTime': endTime,
      'hours': hours,
    };
  }
}
