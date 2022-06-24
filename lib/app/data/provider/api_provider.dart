abstract class ApiProvider {
  static const _baseUrl = 'https://sports-field-reservation.herokuapp.com/api';

  static const register = '$_baseUrl/register';
  static const login = '$_baseUrl/login';

  static const getDetailUser = '$_baseUrl/user/'; // {username}
  static const updateUser = '$_baseUrl/user'; // {userId}

  static const getSchedule =
      '$_baseUrl/reserve'; // ?venue={venueId}&date={date}
  static const getReservationById = '$_baseUrl/reserve/'; // /{userId}
  static const cancelReservation = '$_baseUrl/reserve/'; // /{reservationId}
  static const createReservation = '$_baseUrl/reserve';
  static const updateReservation = '$_baseUrl/reserve';
  static const getScheduleExcludeTxId =
      '$_baseUrl/reserve/schedule'; // ??venue={venueId}&date={date}&txId={txId}

  static const getAllVenue = '$_baseUrl/venue';
  static const getDetailVenue = '$_baseUrl/venue/'; // {venueId}
}
