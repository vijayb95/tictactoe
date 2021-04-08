import 'dart:math';

import 'package:get/get.dart';

class TicTacController extends GetxController {
  Map<int, String> btValues = {
    0: '',
    1: '',
    3: '',
    2: '',
    4: '',
    5: '',
    6: '',
    7: '',
    8: '',
  }.obs;

  void devicePlay(deviceSymb) {
    bool validPlay = false;
    for (var i = 0; i < 10; i++) {
      if (btValues[i] == '') {
        validPlay = true;
        break;
      }
    }
    if (!validPlay) return;
    var rng = new Random();
    int newPosition;
    do {
      newPosition = rng.nextInt(10);
    } while (btValues[newPosition] != '');
    btValues[newPosition] = deviceSymb;
  }

  changePositionalValue(int position, String userSymb) {
    btValues[position] = userSymb;
    String deviceSymb = userSymb == 'X' ? 'O' : 'X';
    devicePlay(deviceSymb);
  }
}
