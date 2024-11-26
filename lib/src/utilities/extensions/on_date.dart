import 'package:intl/intl.dart';

extension DateFormatExtensions on String {
  String day() {
    return DateFormat('dd').format(DateTime.parse(this));
  }

  String hour() {
    return DateFormat('hh').format(DateTime.parse(this));
  }

  String minute() {
    return DateFormat('mm').format(DateTime.parse(this));
  }

  String readable() {
    return DateFormat('dd MMM,hh:mm a').format(DateTime.parse(this));
  }

  String dateTimeString() {
    // if (isNullOrEmpty()) return null;
    List<String> timeParts = split(':');
    int hours = int.parse(timeParts[0]);
    int minute = int.parse(timeParts[1]);

    DateTime combinedDateTime = DateTime(0, 0, 0, hours, minute);

    return combinedDateTime.toIso8601String();
  }

  String formattedDateTime() {
    DateTime timestamp = DateTime.parse(this);
    DateTime now = DateTime.now().toUtc();
    Duration difference = now.difference(timestamp);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} ${difference.inDays > 1 ? 'secs' : 'sec'}ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} ${difference.inMinutes > 1 ? 'mins' : 'min'}ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} ${difference.inHours > 1 ? 'hrs' : 'hr'}ago';
    }
    return DateFormat.yMMMEd().format(timestamp);
  }
}
