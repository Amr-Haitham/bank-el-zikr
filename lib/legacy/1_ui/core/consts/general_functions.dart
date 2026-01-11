String dateIdGenerator(DateTime dateTime) {
  return dateTime.day.toString() +
      dateTime.month.toString() +
      dateTime.year.toString();
}
