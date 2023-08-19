import 'package:radarclock/model/time.dart';


class Installation{

  List<List<int>> installationArray = List.generate(19, (index) => List.filled(19, 0));
  Time time = Time();

  Installation(){
    setTime();
  }

  bool updateTime(){
    return time.update();
  }

  void setTime() {
    int hourFirstStart = (installationArray.length - time.hourFirst.length) ~/ 2;
    int hourFirstEnd = hourFirstStart + time.hourFirst.length;
    for (int i = hourFirstStart; i < hourFirstEnd; i++) {
      for (int j = 0; j < time.hourFirst[i - hourFirstStart].length; j++) {
        installationArray[i][j+1] = time.hourFirst[i - hourFirstStart][j];
      }
    }
    int hourSecondStart = (installationArray.length - time.hourSecond.length) ~/ 2;
    int hourSecondEnd = hourSecondStart + time.hourSecond.length;
    for (int i = hourSecondStart; i < hourSecondEnd; i++) {
      for (int j = 0; j < time.hourSecond[i - hourSecondStart].length; j++) {
        installationArray[i][j + 5] = time.hourSecond[i - hourSecondStart][j];
      }
    }
    //add gd cologne
    installationArray[installationArray.length ~/ 2-1][installationArray.length ~/ 2] = 1;
    installationArray[installationArray.length ~/ 2+1][installationArray.length ~/ 2] = 1;
    int minuteFirstStart = (installationArray.length - time.minuteFirst.length) ~/ 2;
    int minuteFirstEnd = minuteFirstStart + time.minuteFirst.length;
    for (int i = minuteFirstStart; i < minuteFirstEnd; i++) {
      for (int j = 0; j < time.minuteFirst[i - minuteFirstStart].length; j++) {
        installationArray[i][j + 11] = time.minuteFirst[i - minuteFirstStart][j];
      }
    }
    int minuteSecondStart = (installationArray.length - time.minuteSecond.length) ~/ 2;
    int minuteSecondEnd = minuteSecondStart + time.minuteSecond.length;
    for (int i = minuteSecondStart; i < minuteSecondEnd; i++) {
      for (int j = 0; j < time.minuteSecond[i - minuteSecondStart].length; j++) {
        installationArray[i][j + 15] = time.minuteSecond[i - minuteSecondStart][j];
      }
    }
  }



}