import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sports_booking_app/app/data/enum/venue_category_enum.dart';
import 'package:sports_booking_app/app/data/model/user/user_response.dart';
import 'package:sports_booking_app/app/data/model/venue/venue_response.dart';
import 'package:sports_booking_app/app/data/service/reservation_service.dart';
import 'package:sports_booking_app/app/data/service/user_service.dart';
import 'package:sports_booking_app/app/modules/all_venue/controllers/all_venue_controller.dart';
import 'package:sports_booking_app/app/modules/home/controllers/home_controller.dart';
import 'package:sports_booking_app/app/routes/app_pages.dart';

import '../../../core/themes/custom_snackbar_theme.dart';
import '../../../data/model/reservation/reservation_response.dart';
import '../../../data/model/reservation/user_reservation_model.dart';

class ActiveBookingController extends GetxController with StateMixin {
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

  void handleEditReservation(UserReservation reservation) {
    // venue response
    final VenueResponse infoVenue = VenueResponse(
      idVenue: reservation.venueId,
      location: '',
      venueName: reservation.venueName,
      pricePerHour: reservation.pricePerHour,
      category: VenueCategory.basket,
      rating: 0,
      image: '',
    );

    // id tx
    final idTx = reservation.transactionId;

    final arguments = {
      'infoVenue': infoVenue,
      'isEditReservation': true,
      'transactionId': idTx,
    };

    Get.toNamed(Routes.BOOKING_FIELD, arguments: arguments);
  }

  void handleCancelReservation(String transactionId) {
    Get.defaultDialog(
      title: 'Cancel Reservation',
      middleText: 'Are you sure you want to cancel this reservation?',
      onConfirm: () => requestCancelReservation(transactionId),
      textConfirm: 'Yes',
      confirmTextColor: Colors.white,
      textCancel: 'Cancel',
    );
  }

  void requestCancelReservation(String transactionId) {
    ReservationService.cancelReservation(transactionId).then((_) {
      Get.back();

      CustomSnackbar.successSnackbar(
        title: 'Success',
        message: 'Success cancel reservation',
      );

      handleRefresh();
    });
  }

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

  int getPricePerHour(String idVenue) => getDetailVenue(idVenue).pricePerHour;

  String getVenueName(String idVenue) => getDetailVenue(idVenue).venueName;

  String getVenueImage(String idVenue) => getDetailVenue(idVenue).image;

  VenueResponse getDetailVenue(String idVenue) {
    return allvenueController.venues
        .where((element) => element.idVenue == idVenue)
        .first;
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

  Future<void> fetchData() async {
    final userId = dataUser.idUser;
    reservations.value =
        await ReservationService.getReservationListByUserId(userId).then(
      (value) => value.where((element) => element.status == 'valid').toList(),
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
