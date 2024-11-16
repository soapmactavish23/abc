import 'package:flutter/material.dart';

class DateTimeCustom {
  static DateTime? convertDate(String? date) {
    try {
      DateTime dt1 = DateTime.parse(date!);
      return DateTime.fromMillisecondsSinceEpoch(dt1.millisecondsSinceEpoch);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  static String convertTimeInput(String time) {
    String timeChecked = time.replaceRange(5, 8, "");
    return timeChecked;
  }

  static DateTime? convertDateInput(String? date) {
    List<String> dateList = date!.split("/");
    int year = int.parse(dateList[2]);
    int month = int.parse(dateList[1]);
    int day = int.parse(dateList[0]);
    return DateTime(year, month, day);
  }

  static DateTime? convertDateTimeInput(String? value) {
    if (value != null) {
      List<String> listString = value.split("T");
      String? date = listString[0];
      String time = listString[1];

      List<String> dateList = date.split("/");
      int year = int.parse(dateList[2]);
      int month = int.parse(dateList[1]);
      int day = int.parse(dateList[0]);

      List<String> timeList = time.split(":");
      int hour = int.parse(timeList[0]);
      int minute = int.parse(timeList[1]);

      return DateTime(year, month, day, hour, minute);
    } else {
      return null;
    }
  }

  static String? convertToDtSend(DateTime? date) {
    if (date != null) {
      String year = date.year.toString();
      String month = date.month < 10 ? "0${date.month}" : date.month.toString();
      String day = date.day < 10 ? "0${date.day}" : date.day.toString();
      String hour = date.hour < 10 ? "0${date.hour}" : date.hour.toString();
      String minute =
          date.minute < 10 ? "0${date.minute}" : date.minute.toString();
      String second =
          date.second < 10 ? "0${date.second}" : date.second.toString();

      return "$year-$month-${day}T$hour:$minute:$second";
    } else {
      return null;
    }
  }

  static String? convertToDateSend(DateTime? date) {
    if (date != null) {
      String year = date.year.toString();
      String month = date.month < 10 ? "0${date.month}" : date.month.toString();
      String day = date.day < 10 ? "0${date.day}" : date.day.toString();

      return "$year-$month-$day";
    } else {
      return null;
    }
  }

  static String convertDateInputString(DateTime? date) {
    if (date != null) {
      String year = date.year.toString();
      String month = date.month < 10 ? "0${date.month}" : date.month.toString();
      String day = date.day < 10 ? "0${date.day}" : date.day.toString();
      return "$day/$month/$year";
    } else {
      return "";
    }
  }

  static String convertDateTimeString(DateTime? date) {
    if (date != null) {
      String year = date.year.toString();
      String month = date.month < 10 ? "0${date.month}" : date.month.toString();
      String day = date.day < 10 ? "0${date.day}" : date.day.toString();
      String hour = date.hour < 10 ? "0${date.hour}" : date.hour.toString();
      String minute =
          date.minute < 10 ? "0${date.minute}" : date.minute.toString();
      return "$day/$month/$year $hour:$minute";
    } else {
      return "";
    }
  }

  static String convertDateTimeInterval(
      {DateTime? date, required bool isAfter}) {
    if (date != null) {
      int dayInteger = date.day;
      if (isAfter == true) {
        dayInteger += 1;
      } else {
        dayInteger -= 1;
      }
      String year = date.year.toString();
      String month = date.month < 10 ? "0${date.month}" : date.month.toString();
      String day = dayInteger < 10 ? "0$dayInteger" : dayInteger.toString();
      String hour = date.hour < 10 ? "0${date.hour}" : date.hour.toString();
      String minute =
          date.minute < 10 ? "0${date.minute}" : date.minute.toString();
      return "$day/$month/$year $hour:$minute";
    } else {
      return "";
    }
  }
}
