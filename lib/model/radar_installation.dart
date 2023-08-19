import 'dart:math';

import 'package:radarclock/model/installation.dart';

class RadarInstallation {
  late List<List<double>> installationArray;
  late Installation installation;
  late List<List<int>> installationArrayClock;
  late int width;
  late int height;
  late int posX;
  late int posY;
  late int progress;

  RadarInstallation(this.installation) {
    width = installation.installationArray.length;
    height = installation.installationArray[0].length;
    installationArray = List.generate(width, (index) => List.filled(height, 0));
    installationArrayClock = installation.installationArray;
    initializeAuto();
  }

  void initializeAuto() {
    posX = Random().nextInt(width);
    posY = Random().nextInt(height);
    progress = 0;
  }

  void touch(int x, int y) {
    posX = x;
    posY = y;
    resetProgress();
  }

  void resetProgress() {
    progress = 0;
    installationArray = List.generate(width, (index) => List.filled(height, 0));
  }

  void update() {
    lowerOpacity();
    progress++;
    expand();
    if (isFinished()) {
      initializeAuto();
    }
  }

  void expand() {
    int progressTen = progress ~/ 2;
    drawSquare(progressTen);
  }

  void drawSquare(int radius) {
    int startX = posX - radius;
    int startY = posY - radius;
    //Left side
    for (int i = 0; i <= radius * 2; i++) {
      int indexX = startX + i;
      int indexY = startY + i;
      int indexXRadius = startX + radius * 2;
      int indexYRadius = startY + radius * 2;
      place(indexX, startY);
      place(indexX, indexYRadius);
      place(startX, indexY);
      place(indexXRadius, indexY);
    }
  }

  void place(int x, int y) {
    if (x < 0 || x >= width || y < 0 || y >= height) {
      return;
    }
    double opacity = installationArrayClock[x][y] == 1 ? 1 : 0.5;
    installationArray[x][y] = opacity;
  }

  void lowerOpacity() {
    for (int i = 0; i < installationArray.length; i++) {
      for (int j = 0; j < installationArray[0].length; j++) {
        if (installationArray[i][j] - 0.02 > 0) {
          installationArray[i][j] -= 0.02;
        } else {
          installationArray[i][j] = 0;
        }
      }
    }
  }

  bool isFinished() {
    if (progress < 5) {
      return false;
    }
    for (int i = 0; i < installationArray.length; i++) {
      for (int j = 0; j < installationArray[0].length; j++) {
        if (installationArray[i][j] > 0) {
          return false;
        }
      }
    }
    return true;
  }
}
