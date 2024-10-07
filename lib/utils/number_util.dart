import 'package:intl/intl.dart';

class NumberUtil {
  static String numberFormatter(int number) {
    final formatter = NumberFormat('#,###', 'en_US');
    return formatter.format(number).replaceAll(',', ' ');
  }
}
