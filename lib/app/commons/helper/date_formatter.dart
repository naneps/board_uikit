import 'package:intl/intl.dart';

/// A utility class for formatting dates in various formats.
class DateFormatter {
  /// Formats the given date string in the format DD MM YY.
  ///[date 2022-01-01] => 01 01 22
  /// Returns the formatted date string.
  static String formatDDMMYY(String date) {
    final DateTime dateTime = DateTime.parse(date);
    return '${dateTime.day.toString().padLeft(2, '0')}'
        ' ${dateTime.month.toString().padLeft(2, '0')}'
        ' ${dateTime.year.toString().substring(2)}';
  }

  /// Formats the given date string in the format DD MM YYYY.
  ///[date 2022-01-01] => 01 01 2022
  /// Returns the formatted date string.
  static String formatDDMMYYYY(String date) {
    final DateTime dateTime = DateTime.parse(date);
    return '${dateTime.day.toString().padLeft(2, '0')}'
        ' ${dateTime.month.toString().padLeft(2, '0')}'
        ' ${dateTime.year}';
  }

  /// Formats the given date string in the format DD Month YYYY.
  ///[date 2022-01-01] => 01 January 2022
  /// Returns the formatted date string.
  static String formatDDMonthYYYY(String date) {
    final DateTime dateTime = DateTime.parse(date);
    return '${dateTime.day.toString().padLeft(2, '0')}'
        ' ${_getMonthName(dateTime.month)}'
        ' ${dateTime.year}';
  }

  /// Formats the given date string in the format MM DD YY.
  ///[date 2022-01-01] => 01 01 22
  /// Returns the formatted date string.
  static String formatMMDDYY(String date) {
    final DateTime dateTime = DateTime.parse(date);
    return '${dateTime.month.toString().padLeft(2, '0')}'
        ' ${dateTime.day.toString().padLeft(2, '0')}'
        ' ${dateTime.year.toString().substring(2)}';
  }

  /// Formats the given date string in the format MM DD YYYY.
  ///[date 2022-01-01] => 01 01 2022
  /// Returns the formatted date string.
  static String formatMMDDYYYY(String date) {
    final DateTime dateTime = DateTime.parse(date);
    return '${dateTime.month.toString().padLeft(2, '0')}'
        ' ${dateTime.day.toString().padLeft(2, '0')}'
        ' ${dateTime.year}';
  }

  /// Formats the given date string in the format MM YYYY.
  ///[date 2022-01-01] => January 2022
  /// Returns the formatted date string.
  static String formatMMYYYY(String date) {
    final DateTime dateTime = DateTime.parse(date);
    return '${_getMonthName(dateTime.month)} ${dateTime.year}';
  }

  /// Formats the given date string in the format Month DD YYYY.
  ///[date 2022-01-01] => January 01 2022
  /// Returns the formatted date string.
  static String formatMonthDDYYYY(String date) {
    final DateTime dateTime = DateTime.parse(date);
    return '${_getMonthName(dateTime.month)}'
        ' ${dateTime.day.toString().padLeft(2, '0')}'
        ' ${dateTime.year}';
  }

  /// Formats the given date string in the format FullMonth DD YYYY.
  ///[date 2022-01-01] => January 01 2022
  /// Returns the formatted date string.
  static String formatMonthDDYYYYWithFullMonth(String date) {
    final DateTime dateTime = DateTime.parse(date);
    return '${_getFullMonthName(dateTime.month)}'
        ' ${dateTime.day.toString().padLeft(2, '0')}'
        ' ${dateTime.year}';
  }

  /// Returns the full name of the month for the given month number.
  ///[month 1] => January
  /// The month number should be between 1 and 12.
  static String _getFullMonthName(int month) {
    return DateFormat.MMMM().format(DateTime(2022, month));
  }

  /// Returns the abbreviated name of the month for the given month number.
  ///[month 1] => Jan
  /// The month number should be between 1 and 12.
  static String _getMonthName(int month) {
    return DateFormat.MMM().format(DateTime(2022, month));
  }
}
