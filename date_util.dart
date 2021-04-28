DateTime fromStringToDateTime(String value) {
  if (value == null) return null;
  return DateTime.parse(value);
}

String fromDateTimeToJson(DateTime date) {
  if (date == null) return null;
  return date.toUtc().toString();
}
