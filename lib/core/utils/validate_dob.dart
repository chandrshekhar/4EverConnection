class DobValidator {
  static bool isValidDate(String date) {
    String pattern = r'^(0[1-9]|1[0-2])/(0[1-9]|1[0-9]|2[0-9]|3[01])/\d{4}$';
    RegExp regExp = RegExp(pattern);
    if (regExp.hasMatch(date)) {
      // Validate the month, day, and year individually
      List<String> dateComponents = date.split('/');
      int month = int.parse(dateComponents[0]);
      int day = int.parse(dateComponents[1]);
      int year = int.parse(dateComponents[2]);

      if (month < 1 || month > 12) {
        return false; // Invalid month
      }

      if (day < 1 || day > _daysInMonth(month, year)) {
        return false; // Invalid day
      }

      if (year < 1000 || year > 9999) {
        return false; // Invalid year
      }

      return true; // Valid date
    }
    return false; // Invalid format
  }

  static int _daysInMonth(int month, int year) {
    if (month == 2) {
      if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
        return 29; // Leap year
      } else {
        return 28; // Non-leap year
      }
    } else if ([4, 6, 9, 11].contains(month)) {
      return 30;
    } else {
      return 31;
    }
  }
}
