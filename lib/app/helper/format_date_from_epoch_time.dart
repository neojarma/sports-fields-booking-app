import 'package:intl/intl.dart';

String getformattedDateFromEpochTime(int date) {
  final inputtedDate = DateTime.fromMillisecondsSinceEpoch(date);
  return DateFormat("yyyy-MM-dd HH.mm").format(inputtedDate);
}
