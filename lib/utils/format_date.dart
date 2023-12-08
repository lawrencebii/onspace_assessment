import 'package:intl/intl.dart';

String formatTimeToAMPM(DateTime time) {
  DateTime now = DateTime.now();
  String formattedTime = DateFormat('jm').format(time);
  return formattedTime;
}

int differenceInMinutes(DateTime date1, DateTime date2) {
  int diffInSeconds = date2.difference(date1).inSeconds;
  int diffInMinutes = diffInSeconds ~/ 60;
  return diffInMinutes;
}
