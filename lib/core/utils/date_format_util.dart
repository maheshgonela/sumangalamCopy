import 'package:intl/intl.dart';

abstract class DateFormatUtil {
  static final obDateTimeFormat = DateFormat('yyyy-MM-ddTHH:mm:ss');

  static String extractAndFormatDate(String datetimeStr, {String format = 'dd/MM/yyyy'}) {
    DateTime dateTime = DateTime.parse(datetimeStr);
    return DateFormat(format).format(dateTime);
  }

  static String extractAndFormatTime(String datetimeStr, {String format = 'hh:mm a'}) {
    DateTime dateTime = DateFormat('yyyy-MM-ddTHH:mm:ss+05:30').parse(datetimeStr);
    return DateFormat(format).format(dateTime);
  }
}

class DateformatUtil {
  static String formatDate(DateTime date, {String format = 'dd/MM/yyyy'}) {
    return DateFormat(format).format(date);
  }

  static String formatDateWithDMY(String date) {
    DateTime dateTime = DateTime.parse(date);
    return DateFormat('dd-MMM-yyyy').format(dateTime);
  }

  static String formatDateWithMY(DateTime date) {
    return DateFormat('MMMM-yyyy').format(date);
  }
}

