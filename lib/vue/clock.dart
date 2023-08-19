import 'package:flutter/material.dart';
import 'package:radarclock/model/radar_installation.dart';
import 'package:radarclock/vue/color_picker.dart';
import 'package:radarclock/vue/radar.dart';

import '../model/installation.dart';

class Clock extends StatefulWidget {
  static Color color = Colors.green;

  const Clock({Key? key}) : super(key: key);

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> with SingleTickerProviderStateMixin {
  AnimationController? controller;
  late Installation time;
  late RadarInstallation radarInstallation;

  @override
  void initState() {
    super.initState();
    time = Installation();
    radarInstallation = RadarInstallation(time);
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    controller!.repeat();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    double littlest = width < height ? width : height;
    size = Size(littlest, littlest);
    return Scaffold(
        backgroundColor: Colors.black,
        body: Align(
          alignment: Alignment.center,
          child: Stack(
            children: [
              AnimatedBuilder(
                animation: controller!,
                builder: (BuildContext context, Widget? child) {
                  return CustomPaint(
                    painter: Radar(radarInstallation),
                    size: size,
                  );
                },
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const ColorPick();
                    },
                  );
                },
                icon: const Icon(Icons.color_lens),
              ),
            ],
          ),
        ));
  }
}
