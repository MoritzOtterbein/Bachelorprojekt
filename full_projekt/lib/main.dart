import 'package:full_projekt/manual_overview.dart';
import 'package:full_projekt/mensa.dart';
import 'package:full_projekt/overview.dart';
import 'package:full_projekt/uebrsicht.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFFFFFFFF),
          secondary: const Color(0xFF7FC910),
        )),
        home: MyStatefulWidget());
  }
}
