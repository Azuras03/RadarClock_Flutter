import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'clock.dart';

class ColorPick extends StatefulWidget {
  const ColorPick({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ColorPickState();
  }
}

class _ColorPickState extends State<ColorPick> {
  Color pickerColor = Colors.green;
  Color currentColor = Colors.green;

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Choix de la couleur ^^'),
      content: SingleChildScrollView(
        child: ColorPicker(
          pickerColor: Clock.color,
          onColorChanged: (Color color) {
            setState(() {
              Clock.color = color;
            });
          },
          pickerAreaHeightPercent: 0.8,
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Oki :D'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}