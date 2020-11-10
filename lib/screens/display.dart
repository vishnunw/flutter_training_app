import 'package:flutter/material.dart';
import 'package:flutter_app/screens/keypad.dart';

class Display extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('TestApp'),
      ),
      body: ListView(shrinkWrap: true, children: <Widget>[
        Column(
          children: <Widget>[
            Text('Test'),
            Keypad(),
          ],
        ),
      ]),
    );
  }
}
