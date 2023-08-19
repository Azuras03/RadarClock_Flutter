import 'package:flutter/material.dart';
import 'package:radarclock/vue/clock.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radar Clock',
      theme: ThemeData(
        useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: Colors.green).copyWith(background: Colors.black),
      ),
      home: const Clock(),
    );
  }
}