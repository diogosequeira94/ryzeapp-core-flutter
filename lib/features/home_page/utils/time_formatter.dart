class TimeFormatterUtil {
  static String parseTimeStamp({int hour, int minutes}) {
    var formattedHour = hour.toString();
    var formattedMinutes = minutes.toString();

    if (hour.toString().length == 1) {
      formattedHour = '0${hour.toString()}';
    }

    if (minutes.toString().length == 1) {
      formattedMinutes = '0${minutes.toString()}';
    }
    return '$formattedHour:$formattedMinutes';
  }
}
