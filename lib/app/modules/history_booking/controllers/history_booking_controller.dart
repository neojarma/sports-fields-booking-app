import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../data/model/reservation/reservation_response.dart';
import '../../../data/model/reservation/user_reservation_model.dart';
import '../../../data/model/user/user_response.dart';
import '../../../data/model/venue/venue_response.dart';
import '../../../data/service/reservation_service.dart';
import '../../../data/service/user_service.dart';
import '../../all_venue/controllers/all_venue_controller.dart';
import '../../home/controllers/home_controller.dart';

class HistoryBookingController extends GetxController with StateMixin {
  final homeController = Get.find<HomeController>();
  final allvenueController = Get.find<AllVenueController>();
  final refreshController = RefreshController();

  var reservations = <ReservationResponse>[].obs;
  var bookedFieldsModel = <UserReservation>[].obs;

  late final UserResponse dataUser;

  @override
  void onReady() {
    firstTimeFetchData();

    super.onReady();
  }

  void firstTimeFetchData() async {
    change(false, status: RxStatus.loading());

    final username = homeController.username;
    dataUser = await UserService.getUser(username);
    fetchData().then((_) {
      updateBookedFields();
      change(true, status: RxStatus.success());
    });
  }

  VenueResponse getDetailVenue(String idVenue) {
    return allvenueController.venues
        .where((element) => element.idVenue == idVenue)
        .first;
  }

  int getPricePerHour(String idVenue) => getDetailVenue(idVenue).pricePerHour;

  String getVenueName(String idVenue) => getDetailVenue(idVenue).venueName;

  String getVenueImage(String idVenue) => getDetailVenue(idVenue).image;

  void updateBookedFields() {
    bookedFieldsModel.value = reservations.map(
      (element) {
        element.hours.sort();

        return UserReservation(
          venueId: element.venueId,
          transactionId: element.transactionId,
          venueName: getVenueName(element.venueId),
          pricePerHour: getPricePerHour(element.venueId),
          totalPrice: element.totalPrice,
          hours: element.hours,
          bookingTime: element.bookingTime,
          playTime: element.beginTime,
          imageLink: getVenueImage(element.venueId),
        );
      },
    ).toList();
    refresh();
  }

  Future<void> fetchData() async {
    final userId = dataUser.idUser;
    reservations.value =
        await ReservationService.getReservationListByUserId(userId).then(
      (value) => value.where((element) => element.status == 'invalid').toList(),
    );
  }

  void handleRefresh() async {
    refreshController.requestRefresh();
    fetchData().then((_) {
      updateBookedFields();
      refreshController.refreshCompleted();
    });
  }
}
