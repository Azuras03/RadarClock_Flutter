import 'package:flutter/material.dart';
import 'package:radarclock/model/radar_installation.dart';

import 'clock.dart';

class Radar extends CustomPainter {
  RadarInstallation time;
  Radar(this.time);

  @override
  void paint(Canvas canvas, Size size) {
    time.update();
    double littlest = size.width < size.height ? size.width : size.height;
    int timeArrayLength = time.width;
    int timeArraySubLength = time.height;
    int tileSize = (littlest / timeArrayLength).floor();
    for (int i = 0; i < timeArrayLength; i++) {
      for (int j = 0; j < timeArraySubLength; j++) {

        canvas.drawCircle(
            Offset(
                (j * tileSize) + tileSize / 2, (i * tileSize) + tileSize / 2),
            tileSize / 2,
            Paint()
              ..color = Clock.color.withOpacity(time.installationArray[i][j]));
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    if (time.installation.updateTime()) {
      time.installation.setTime();
    }
    return true;
  }
}
