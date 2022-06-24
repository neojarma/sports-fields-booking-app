class UserReservation {
  String transactionId;
  String venueName;
  String venueId;
  int pricePerHour;
  int totalPrice;
  List<int> hours;
  int bookingTime;
  int playTime;
  String imageLink;

  UserReservation({
    required this.venueId,
    required this.imageLink,
    required this.transactionId,
    required this.venueName,
    required this.pricePerHour,
    required this.totalPrice,
    required this.hours,
    required this.bookingTime,
    required this.playTime,
  });
}
