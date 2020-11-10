import 'package:flutter/material.dart';
import 'package:flutter_app/screens/display.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Display(),
    );
  }
}

