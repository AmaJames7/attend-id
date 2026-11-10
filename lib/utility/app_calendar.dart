class AppCalendar {
  static String getYear() {
    DateTime dt = DateTime.now();
    return dt.year.toString();
  }

  static String getYearFrom(DateTime dt) {
    return "${dt.year}";
  }

  static String getSheetDate() {
    DateTime dt = DateTime.now();
    return "${getMonthOf(dt.month)} ${dt.day} ${dt.year}";
  }

  static String getDayOfWeek() {
    DateTime dt = DateTime.now();
    return getDayOf(dt.weekday);
  }

  static String getShortDayOfWeekFrom(DateTime dt) {
    return getShortDayOf(dt.weekday);
  }

  static String getDayOfWeekFrom(DateTime dt) {
    return getDayOf(dt.weekday);
  }

  static String getDate() {
    DateTime dt = DateTime.now();
    return "${getMonthOf(dt.month)} ${dt.day}, ${dt.year}";
  }

  static String getCurrentTime() {
    // DateTime dt = DateTime.now();
    return "${getHour()}:${getMinute()} ${getamPM()}";
  }

  static String getShortDate() {
    DateTime dt = DateTime.now();
    return "${getMonthOf(dt.month)} ${dt.day}";
  }

  static int getTimeStamp() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  static String getHour() {
    DateTime time = DateTime.now();
    String hour = (time.hour > 12)
        ? "${time.hour - 12}"
        : (time.hour == 0)
        ? "12"
        : "${time.hour}";
    return hour;
  }

  static String getMinute() {
    DateTime time = DateTime.now();
    String minutePart = (time.minute == 0)
        ? "00"
        : (time.minute < 10)
        ? "0${time.minute}"
        : "${time.minute}";
    return minutePart;
  }

  static String getamPM() {
    DateTime time = DateTime.now();
    return (time.hour < 12) ? "am" : "pm";
  }

  static String getHourOf(DateTime time) {
    String hour = (time.hour > 12)
        ? "${time.hour - 12}"
        : (time.hour == 0)
        ? "12"
        : "${time.hour}";
    return hour;
  }

  static String getMinuteOf(DateTime time) {
    String minutePart = (time.minute == 0)
        ? "00"
        : (time.minute < 10)
        ? "0${time.minute}"
        : "${time.minute}";
    return minutePart;
  }

  static String getamPMOf(DateTime time) {
    return (time.hour < 12) ? "am" : "pm";
  }

  // static int getTimeStampOf( int hour, int minute ){

  //   return
  //     DateTime(
  //       2023, //year
  //       0, //month
  //       0, //day
  //       hour,
  //       minute,
  //       0
  //   ).millisecondsSinceEpoch;

  // }

  static String getMonthOf(int month) {
    switch (month) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "March";
      case 4:
        return "April";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "Aug";
      case 9:
        return "Sept";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";

      default:
        return "";
    }
  }

  static String getDayOf(int day) {
    switch (day) {
      case 1:
        return "Monday";
      case 2:
        return "Tuesday";
      case 3:
        return "Wednesday";
      case 4:
        return "Thursday";
      case 5:
        return "Friday";
      case 6:
        return "Saturday";
      case 7:
        return "Sunday";
      default:
        return "";
    }
  }

  static String getShortDayOf(int day) {
    switch (day) {
      case 1:
        return "Mon";
      case 2:
        return "Tue";
      case 3:
        return "Wed";
      case 4:
        return "Thur";
      case 5:
        return "Fri";
      case 6:
        return "Sat";
      case 7:
        return "Sun";
      default:
        return "";
    }
  }

  static String whenIsDate(String day, String month, String year) {
    if (day.isNotEmpty && month.isNotEmpty && year.isNotEmpty) {
      var now = DateTime.now();
      var today = DateTime.utc(now.year, now.month, now.day);
      var ref = DateTime.utc(int.parse(year), int.parse(month), int.parse(day));
      if (ref.isAtSameMomentAs(today)) {
        return "Today";
      } else if (ref.isAfter(today)) {
        return "Upcoming";
      } else {
        return "Expired";
      }
    } else {
      return "not set";
    }
  }

  static String composeDate(String day, int month, String year) {
    if (day.isEmpty || year.isEmpty) {
      return "";
    } else {
      return "${AppCalendar.getMonthOf(month)} $day, $year";
    }
  }

  static String getDateFrom(DateTime dt) {
    return "${AppCalendar.getMonthOf(dt.month)} ${dt.day}, ${dt.year}";
  }

  static String getShortDateFrom(DateTime dt) {
    return "${AppCalendar.getMonthOf(dt.month)}-${dt.day}";
  }

  static String getTimeFrom(DateTime dt) {
    return "${AppCalendar.getHourOf(dt)}:${getMinuteOf(dt)} ${getamPMOf(dt)}";
  }
}
