import 'package:flutter/material.dart';

class Keypad extends StatelessWidget {
  final Map<String, String> keyBoard = {
    '1': '',
    '2': 'ABC',
    '3': 'DEF',
    '4': 'GHI',
    '5': 'JKL',
    '6': 'MNO',
    '7': 'PQRS',
    '8': 'TUV',
    '9': 'WXYZ',
    '*': '(P)',
    '0': '+',
    '#': '(W)'
  };
  List<String> charactersPressed = List<String>();

  List<OutlineButton> getButtons(int startIndex) {
    List<OutlineButton> outlineButton = List<OutlineButton>();
    int endIndex = startIndex + 3;
    for (int i = startIndex; i < endIndex; i++) {
      outlineButton.add(OutlineButton(
        onPressed: () {
          String values = keyBoard.values.toList()[i];
          for (int j = 0; j < values.length; j++) {
            charactersPressed.add(values[j]);
          }

          print(charactersPressed);
        },
        child: Column(
          children: [
            Text('${keyBoard.keys.toList()[i]}'),
            Text('${keyBoard.values.toList()[i]}'),
          ],
        ),
      ));
    }
    return outlineButton;
  }

  List<Row> getWidgets() {
    List<Row> keyBoardRow = List<Row>();
    for (int i = 0; i < keyBoard.length / 3; i++) {
      keyBoardRow.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: i == 0 ? getButtons(0) : getButtons((i * 3)),
        ),
      );
    }
    return keyBoardRow;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: getWidgets(),
    );
  }
}
