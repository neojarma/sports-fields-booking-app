class VenueResponse {
  String idVenue;
  String venueName;
  int pricePerHour;
  String location;
  String category;
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
    return VenueResponse(
      idVenue: json['idVenue'],
      venueName: json['title'],
      location: json['location'],
      pricePerHour: json['price'],
      category: json['category'],
      rating: json['rating'],
      image: json['image'],
    );
  }
}
