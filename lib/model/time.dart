import 'numbers.dart';

class Time {
  late DateTime _time;
  List<List<int>> hourFirst = Numbers.numbers[0];
  List<List<int>> hourSecond = Numbers.numbers[0];
  List<List<int>> minuteFirst = Numbers.numbers[0];
  List<List<int>> minuteSecond = Numbers.numbers[0];

  Time() {
    _time = DateTime.now();
    updateNumbers();
  }

  DateTime get time => _time;

  bool update() {
    DateTime newTime = DateTime.now();
    if (newTime.minute != _time.minute) {
      _time = newTime;
      updateNumbers();
      return true;
    }
    return false;
  }

  void updateNumbers() {
    int hour = _time.hour;
    int minute = _time.minute;
    hourFirst = Numbers.numbers[hour ~/ 10];
    hourSecond = Numbers.numbers[hour % 10];
    minuteFirst = Numbers.numbers[minute ~/ 10];
    minuteSecond = Numbers.numbers[minute % 10];
  }
}