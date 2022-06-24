import 'package:intl/intl.dart';

String getFormattedPrice(int price) {
  NumberFormat numberFormat = NumberFormat.decimalPattern("ID");
  return numberFormat.format(price);
}
