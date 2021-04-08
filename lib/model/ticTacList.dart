import 'package:flutter/material.dart';

class TicTacList {
  Map<int, String> btValues = {
    0: '0',
    1: '1',
    3: '2',
    2: '3',
    4: '4',
    5: '5',
    6: '6',
    7: '7',
    8: '8',
  };

  final int position;
  final String userSymb;

  TicTacList({
    @required this.position,
    @required this.userSymb,
  });

  void changePositionalValue() {
    btValues[position] = userSymb;
  }
}
