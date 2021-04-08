import 'package:get/get.dart';
import 'package:tictactoe/model/ticTacList.dart';

class TicTacController extends GetxController {
  var count = 0.obs;
  increment() {
    count++;
    update();
  }
}
