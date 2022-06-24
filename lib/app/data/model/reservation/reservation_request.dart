class ReservationRequest {
  final String? idTransaction;
  final String? venueId;
  final String? userId;
  final int bookingTime;
  final int beginTime;
  final int endTime;
  final List<int> hours;
  final int totalPrice;

  ReservationRequest({
    this.idTransaction,
    this.venueId,
    this.userId,
    required this.beginTime,
    required this.endTime,
    required this.hours,
    required this.bookingTime,
    required this.totalPrice,
  });

  Map<String, dynamic> updateReservationToJson() {
    return {
      'idTransaction': idTransaction,
      'beginTime': beginTime,
      'endTime': endTime,
      'hours': hours,
      'bookingTime': bookingTime,
      'totalPrice': totalPrice,
    };
  }

  Map<String, dynamic> createReservationToJson() {
    return {
      'venueId': venueId,
      'userId': userId,
      'beginTime': beginTime,
      'endTime': endTime,
      'hours': hours,
      'bookingTime': bookingTime,
      'totalPrice': totalPrice,
    };
  }
}
