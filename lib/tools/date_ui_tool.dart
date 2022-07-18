class DateUITool {
  final DateTime date;

  const DateUITool(this.date);

  String get dayStr => _addZeroIfNeed(date.day);
  String get monthStr => _addZeroIfNeed(date.month);
  String get yearStr => date.year.toString();
  String get hourStr => _addZeroIfNeed(date.hour);
  String get minuteStr => _addZeroIfNeed(date.minute);

  String _addZeroIfNeed(int value) {
    if(value >= 10) return value.toString();
    return '0$value';
  }

  String makeShortDotString() {
    return '$dayStr.$monthStr.$yearStr';
  }

  String makeDayMonthNameYearTimeString() {
    return '$dayStr ${parentalMonthNames[date.month - 1]} $yearStr $hourStr:$minuteStr';
  }

  static List<String> parentalMonthNames = [
    'января',
    'февраля',
    'марта',
    'апреля',
    'мая',
    'июня',
    'июля',
    'августа',
    'сентября',
    'октября',
    'ноября',
    'декабря',
  ];
}