import 'package:get/get.dart';
import 'package:sports_booking_app/app/data/provider/api_provider.dart';

import '../model/venue/venue_response.dart';

class VenueRepository {
  static final getConnect = GetConnect();

  static Future<List<VenueResponse>> getVenues() async {
    final response = await getConnect.get(ApiProvider.getAllVenue);
    final data = response.body['data'] as List;
    return data.map((venue) => VenueResponse.fromJson(venue)).toList();
  }

  static Future<VenueResponse> getDetailVenue(String idVenue) async {
    final url = '${ApiProvider.getDetailVenue}$idVenue';
    final respose = await getConnect.get(url);
    final data = respose.body['data'];
    return VenueResponse.fromJson(data);
  }
}
