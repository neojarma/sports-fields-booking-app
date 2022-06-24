class ReservationResponse {
  final String transactionId;
  final String venueId;
  final int beginTime;
  final int endTime;
  final String status;
  final List<int> hours;
  final int bookingTime;
  final int totalPrice;

  ReservationResponse({
    required this.status,
    required this.transactionId,
    required this.venueId,
    required this.beginTime,
    required this.endTime,
    required this.bookingTime,
    required this.hours,
    required this.totalPrice,
  });

  factory ReservationResponse.fromJson(Map<String, dynamic> json) {
    return ReservationResponse(
      status: json['status'],
      transactionId: json['idTransaction'],
      venueId: json['idVenue'],
      beginTime: json['beginTime'],
      endTime: json['endTime'],
      bookingTime: json['bookingTime'],
      hours: json['hours'].cast<int>(),
      totalPrice: json['totalPrice'],
    );
  }
}
