import 'package:sports_booking_app/app/data/enum/venue_category_enum.dart';

class VenueResponse {
  String idVenue;
  String venueName;
  int pricePerHour;
  String location;
  VenueCategory category;
  double rating;
  String image;

  VenueResponse({
    required this.idVenue,
    required this.location,
    required this.venueName,
    required this.pricePerHour,
    required this.category,
    required this.rating,
    required this.image,
  });

  factory VenueResponse.fromJson(Map<String, dynamic> json) {
    VenueCategory category = VenueCategory.basket;

    switch (json['category']) {
      case 'futsal':
        category = VenueCategory.futsal;
        break;

      case 'basket':
        category = VenueCategory.basket;
        break;

      case 'mini soccer':
        category = VenueCategory.miniSoccer;
        break;

      case 'football':
        category = VenueCategory.footbal;
        break;
    }

    return VenueResponse(
      idVenue: json['idVenue'],
      venueName: json['title'],
      location: json['location'],
      pricePerHour: json['price'],
      category: category,
      rating: json['rating'],
      image: json['image'],
    );
  }
}
