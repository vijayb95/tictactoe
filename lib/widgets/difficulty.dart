import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoe/controller/ticTacController.dart';

class DifficultyChooser extends StatelessWidget {
  const DifficultyChooser({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TicTacController controller = Get.find();

    //Show dialog box with Match Status
    Future<void> _showMyDialog(String message, String img) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(message),
            content: Center(
              child: Container(
                height: 400,
                width: 400,
                child: Image.asset(
                  img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Let\'s Do It!'))
            ],
          );
        },
      );
    }

    return Container(
      height: 200,
      width: 315,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              onPressed: () {
                controller.difficulty.value = GameDifficulty.Easy;
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
              ),
              color: Theme.of(context).primaryColor,
              child: Obx(() => Text(
                    'Easy',
                    style: TextStyle(
                        color:
                            controller.difficulty.value == GameDifficulty.Easy
                                ? Colors.white60
                                : Colors.black87),
                  )),
            ),
            MaterialButton(
              onPressed: () {
                controller.difficulty.value = GameDifficulty.Medium;
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
              ),
              color: Theme.of(context).primaryColor,
              child: Obx(() => Text(
                    'Medium',
                    style: TextStyle(
                        color:
                            controller.difficulty.value == GameDifficulty.Medium
                                ? Colors.white60
                                : Colors.black87),
                  )),
            ),
            MaterialButton(
              onPressed: () {
                controller.difficulty.value = GameDifficulty.Hard;
                _showMyDialog(
                    'Hope you\'re a Genius!', 'assets/images/genius.png');
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
              ),
              color: Theme.of(context).primaryColor,
              child: Obx(() => Text(
                    'Hard',
                    style: TextStyle(
                        color:
                            controller.difficulty.value == GameDifficulty.Hard
                                ? Colors.white60
                                : Colors.black87),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
