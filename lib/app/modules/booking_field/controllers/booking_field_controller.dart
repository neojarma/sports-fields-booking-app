import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sports_booking_app/app/core/themes/custom_snackbar_theme.dart';
import 'package:sports_booking_app/app/data/model/reservation/schedule_request.dart';
import 'package:sports_booking_app/app/data/model/venue/venue_response.dart';
import 'package:sports_booking_app/app/data/service/reservation_service.dart';
import 'package:sports_booking_app/app/helper/formatted_price.dart';
import 'package:sports_booking_app/app/modules/booking_field/widgets/dialog_content.dart';
import 'package:sports_booking_app/app/modules/home/controllers/home_controller.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../data/model/reservation/reservation_request.dart';

const millisecondToHour = 3600000;

class BookingFieldController extends GetxController {
  late final VenueResponse infoVenue;
  late final bool isEditReservation;
  late final String transactionId;

  final homeController = Get.find<HomeController>();
  final refreshController = RefreshController();

  int userPickDateSinceEpoch = 0;

  late List<int> hours;
  var temporaryHours = <int>[].obs;

  List<int> userHours = [];

  @override
  void onInit() {
    parsingArgument();

    super.onInit();
  }

  @override
  void onReady() {
    initializeDate();

    isEditReservation ? initalizeHourEdit() : initalizeHour();

    super.onReady();
  }

  void parsingArgument() {
    infoVenue = Get.arguments['infoVenue'];
    isEditReservation = Get.arguments['isEditReservation'];
    transactionId = Get.arguments['transactionId'];
  }

  Future<void> refreshSchedule(bool isSubmitRequest) async {
    final request = ScheduleRequest(
      venueId: infoVenue.idVenue,
      date: userPickDateSinceEpoch,
    );

    refreshController.requestRefresh();
    hours = await ReservationService.getSchedule(request).then((value) {
      refreshController.refreshCompleted();
      return value;
    });

    if (!isSubmitRequest) {
      temporaryHours.value = [...hours];
      userHours.clear();
    }
  }

  void handleEditReservation() async {
    final beginTime = userPickDateSinceEpoch + userHours[0] * millisecondToHour;
    final endTime = userPickDateSinceEpoch +
        userHours[userHours.length - 1] * millisecondToHour;
    final totalPrice = infoVenue.pricePerHour * userHours.length;
    final request = ReservationRequest(
      idTransaction: transactionId,
      totalPrice: totalPrice,
      beginTime: beginTime,
      endTime: endTime,
      hours: userHours,
      venueId: infoVenue.idVenue,
      userId: homeController.dataUser?.idUser,
      bookingTime: getCurrentDateTime().millisecondsSinceEpoch,
    );

    await ReservationService.updateReservation(request).then(
      (_) {
        CustomSnackbar.successSnackbar(
            title: 'Success', message: 'Reservation update succes');
        refreshSchedule(true);
      },
    );
  }

  void createReservation() async {
    final beginTime = userPickDateSinceEpoch + userHours[0] * millisecondToHour;
    final endTime = userPickDateSinceEpoch +
        userHours[userHours.length - 1] * millisecondToHour;
    final totalPrice = infoVenue.pricePerHour * userHours.length;
    final request = ReservationRequest(
      totalPrice: totalPrice,
      beginTime: beginTime,
      endTime: endTime,
      hours: userHours,
      venueId: infoVenue.idVenue,
      userId: homeController.dataUser?.idUser,
      bookingTime: getCurrentDateTime().millisecondsSinceEpoch,
    );

    final dialogModel = DialogContentModel(
      venueName: infoVenue.venueName,
      pricePerHour: 'Rp. ${getFormattedPrice(infoVenue.pricePerHour)}',
      totalHour: userHours.length.toString(),
      totalPrice: 'Rp. ${getFormattedPrice(totalPrice)}',
      onConfirm: () {
        createReservationRequest(request);
        Get.back();
      },
    );

    showOrderDialogSummary(dialogModel);
  }

  void createReservationRequest(ReservationRequest request) async {
    await ReservationService.createReservation(request).then(
      (_) {
        CustomSnackbar.successSnackbar(
            title: 'Success', message: 'Reservation process succes');
        refreshSchedule(true);
      },
    );
  }

  void handleSubmitBookingField() async {
    if (userHours.isEmpty) {
      CustomSnackbar.failedSnackbar(
        title: 'Error',
        message: 'Please select time',
      );
      return;
    }

    userHours.sort();

    if (isEditReservation) {
      handleEditReservation();
      return;
    }

    createReservation();
  }

  void initializeDate() {
    final now = getCurrentDateTime();
    final pureDate = DateTime(now.year, now.month, now.day);
    userPickDateSinceEpoch = pureDate.millisecondsSinceEpoch;
  }

  void initalizeHour() async {
    final request = ScheduleRequest(
      venueId: infoVenue.idVenue,
      date: userPickDateSinceEpoch,
    );
    refreshController.requestRefresh();
    hours = await ReservationService.getSchedule(request).then((value) {
      refreshController.refreshCompleted();
      return value;
    });

    temporaryHours.value = [...hours];
  }

  void initalizeHourEdit() async {
    final request = ScheduleRequest(
      venueId: infoVenue.idVenue,
      date: userPickDateSinceEpoch,
      txId: transactionId,
    );

    refreshController.requestRefresh();
    hours =
        await ReservationService.getScheduleExcludeTxId(request).then((value) {
      refreshController.refreshCompleted();
      return value;
    });

    temporaryHours.value = [...hours];
  }

  void handleUserTimePick(int inputHour) {
    final isUserSelectedHourFromAPI = hours.contains(inputHour);
    if (isUserSelectedHourFromAPI) return;

    userHours.sort();

    final isUserTryToDeleteMiddleNumber =
        userHours.length == 3 && userHours[1] == inputHour;
    if (isUserTryToDeleteMiddleNumber) return;

    final isUserAlreadySelectTime = temporaryHours.contains(inputHour);
    if (isUserAlreadySelectTime) {
      temporaryHours.remove(inputHour);
      userHours.remove(inputHour);
      return;
    }

    if (userHours.isNotEmpty) {
      if (isMoreThanThreeHours()) return;

      if (!isConsecutive(inputHour)) return;
    } else {
      userHours.add(inputHour);
      temporaryHours.add(inputHour);
    }
  }

  bool isConsecutive(int inputHour) {
    final lastPrevNumber = userHours[userHours.length - 1];
    final isConsecutive = lastPrevNumber + 1 == inputHour ||
        lastPrevNumber - 1 == inputHour ||
        lastPrevNumber - 2 == inputHour;

    if (isConsecutive) {
      temporaryHours.add(inputHour);
      userHours.add(inputHour);
      return true;
    }

    CustomSnackbar.failedSnackbar(
      title: 'Error',
      message: 'Please pick consecutive number',
    );
    return false;
  }

  bool isMoreThanThreeHours() {
    final isMoreThanThreeHours = userHours.length >= 3;
    if (isMoreThanThreeHours) {
      CustomSnackbar.failedSnackbar(
        title: 'Error',
        message: 'Booking time max 3 hours',
      );
      return true;
    }

    return false;
  }

  void handleUserDatePick(
      DateRangePickerSelectionChangedArgs selectedDate) async {
    DateTime selectedDateTime = selectedDate.value;
    userPickDateSinceEpoch = selectedDateTime.millisecondsSinceEpoch;

    final request = ScheduleRequest(
        venueId: infoVenue.idVenue, date: userPickDateSinceEpoch);

    refreshController.requestRefresh();
    hours = (isEditReservation)
        ? await ReservationService.getScheduleExcludeTxId(request)
        : await ReservationService.getSchedule(request);

    temporaryHours.value = [...hours];
    refreshController.refreshCompleted();

    userHours.clear();
  }

  DateTime getCurrentDateTime() => DateTime.now();

  DateTime getMaxDateTimeCalendar() => DateTime.now().add(
        const Duration(days: 90),
      );
}
