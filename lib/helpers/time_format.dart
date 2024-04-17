import 'package:intl/intl.dart';

class TimeFormatHelper{

  static   String formatDate(DateTime date) {
    return DateFormat('EEEE dd MMM, yyyy').format(date);
  }


}