import 'package:intl/intl.dart';

String formatDate(DateTime datetime) {
  final DateFormat formatter = DateFormat('d MMM, y');
  return formatter.format(datetime);
}

String timeFormat(DateTime datetime) {
  final DateFormat formatter = DateFormat('hh:mm a');
  return formatter.format(datetime);
}
