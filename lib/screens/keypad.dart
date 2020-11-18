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
  final List<String> words = ['BAT', 'CAT', 'ARC', 'DOT', 'CAR'];
  List<String> temp = List<String>();
  List<String> tempWords = List<String>();
  List<OutlineButton> getButtons(int startIndex) {
    List<OutlineButton> outlineButton = List<OutlineButton>();
    int endIndex = startIndex + 3;
    for (int i = startIndex; i < endIndex; i++) {
      outlineButton.add(OutlineButton(
        onPressed: () {
          temp.add(keyBoard.values.toList()[i]);
          getWords(keyBoard.values.toList()[i]);
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

  String matchWords(String values) {
    String exactWord = '';
    String characters = values;
    for (int i = 0; i < words.length; i++) {
      for (int j = 0; j < characters.length; j++) {
        if (words[i].contains(characters[j]) && !tempWords.contains(words[i])) {
          tempWords.add(words[i]);
        }
        for (int k = 0; k < tempWords.length; k++) {
          for (int l = 0; l < characters.length; l++) {
            if (tempWords[k].contains(characters[l]) &&
                !exactWord.contains(characters[l])) {
              exactWord += characters[l];
            }
          }
        }
      }
    }
    print(tempWords);
    print(exactWord);
  }

  String getWords(String values) {
    List<int> removeIndex = <int>[];
    if (tempWords.isNotEmpty) {
      for (int i = 0; i < tempWords.length; i++) {
        bool shouldRemove = true;
        for (int j = 0; j < values.length; j++) {
          if (tempWords[i].contains(values[j])) {
            shouldRemove = false;
            break;
          }
        }
        if (shouldRemove) {
          removeIndex.add(i);
        }
      }
    } else {
      for (int i = 0; i < words.length; i++) {
        for (int j = 0; j < values.length; j++) {
          if (words[i].contains(values[j])) {
            if (!tempWords.contains(words[i])) {
              tempWords.add(words[i]);
            }
          }
        }
      }
    }
    if (removeIndex.isNotEmpty) {
      removeIndex.sort((a, b) => b.compareTo(a));
      for (int val in removeIndex) {
        tempWords.removeAt(val);
      }
    }
    String exactWord;
    if (tempWords.length > 1) {
      exactWord = tempWords[0];
      print(exactWord);
      return exactWord;
    } else {
      exactWord = tempWords.toString();
      print(exactWord);
      return exactWord;
    }

    // return tempWords.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: getWidgets(),
    );
  }
}
