/// Дополнение функционала для DateTime
extension DateTimeExtension on DateTime? {
  bool isAfterOrEqual(DateTime dateTime) {
    final date = this;
    if (date == null) return false;

    return date.isAtSameMomentAs(dateTime) || date.isAfter(dateTime);
  }

  bool isBeforeOrEqual(DateTime dateTime) {
    final date = this;
    if (date == null) return false;

    return date.isAtSameMomentAs(dateTime) || date.isBefore(dateTime);
  }

  bool isBetween(DateTime fromDateTime, DateTime toDateTime) {
    final date = this;
    if (date == null) return false;

    return date.isAfterOrEqual(fromDateTime) &&
        date.isBeforeOrEqual(toDateTime);
  }
}
