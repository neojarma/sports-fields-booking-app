import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sports_booking_app/app/core/themes/custom_snackbar_theme.dart';
import 'package:sports_booking_app/app/data/model/reservation/reservation_request.dart';
import 'package:sports_booking_app/app/data/model/reservation/schedule_request.dart';
import 'package:sports_booking_app/app/data/model/venue/venue_response.dart';
import 'package:sports_booking_app/app/data/service/reservation_service.dart';
import 'package:sports_booking_app/app/modules/home/controllers/home_controller.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class BookingFieldController extends GetxController {
  final VenueResponse infoVenue = Get.arguments;
  final homeController = Get.find<HomeController>();
  final refreshController = RefreshController();

  int userPickDateSinceEpoch = 0;

  late List<int> hours;
  var temporaryHours = <int>[].obs;

  List<int> userHours = [];

  @override
  void onInit() {
    initializeHour();

    super.onInit();
  }

  Future<void> refreshSchedule() async {
    final request = ScheduleRequest(
      venueId: infoVenue.idVenue,
      date: userPickDateSinceEpoch,
    );

    hours = await ReservationService.getSchedule(request).then((value) {
      refreshController.refreshCompleted();
      return value;
    });

    temporaryHours.value = [...hours];
  }

  void handleSubmitBookingField() async {
    if (userHours.isEmpty) {
      CustomSnackbar.failedSnackbar(
        title: 'Error',
        message: 'Please select time',
      );
      return;
    }

    const millisecondToHour = 3600000;

    final beginTime = userPickDateSinceEpoch + userHours[0] * millisecondToHour;
    final endTime = userPickDateSinceEpoch +
        userHours[userHours.length - 1] * millisecondToHour;
    final request = ReservationRequest(
      beginTime: beginTime,
      endTime: endTime,
      hours: userHours,
      venueId: infoVenue.idVenue,
      userId: homeController.dataUser?.idUser,
    );

    await ReservationService.createReservation(request).then(
      (_) => CustomSnackbar.successSnackbar(
          title: 'Success', message: 'Reservation process succes'),
    );
  }

  void initializeHour() async {
    final now = getCurrentDateTime();
    final pureDate = DateTime(now.year, now.month, now.day);
    userPickDateSinceEpoch = pureDate.millisecondsSinceEpoch;

    final request = ScheduleRequest(
      venueId: infoVenue.idVenue,
      date: userPickDateSinceEpoch,
    );

    hours = await ReservationService.getSchedule(request);

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
    final isMoreThanThreeHours = userHours.length > 3;
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
    hours = await ReservationService.getSchedule(request);

    temporaryHours.value = [...hours];

    userHours.clear();
  }

  DateTime getCurrentDateTime() => DateTime.now();

  DateTime getMaxDateTimeCalendar() => DateTime.now().add(
        const Duration(days: 90),
      );
}
