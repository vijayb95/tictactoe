// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoe/controller/ticTacController.dart';

class BtnContainer extends StatelessWidget {
  final contVal;
  BtnContainer({Key key, this.contVal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Finding the controller which was initialized in main.dart
    final TicTacController controller = Get.find();

    //Show dialog box with Match Status
    Future<void> _showMyDialog(String message, String img) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(message),
            content: Image.asset(img),
          );
        },
      );
    }

    //Emptying the Tic-Tac-Toe board
    void _clearBoard() {
      controller.resetBoard();
    }

    //Action to do when the player gives a game input
    void _buttonPressed() {
      var matchStatus = controller.changePositionalValue(contVal);
      if (matchStatus == PlayerStatus.win) {
        _showMyDialog('You\'ve Won!🎉', 'assets/images/party.png');
        controller.playerStreak.value++;
        _clearBoard();
      }
      if (matchStatus == PlayerStatus.lost) {
        _showMyDialog('You\'ve Lost.💔', 'assets/images/effort.png');
        controller.botStreak.value++;
        _clearBoard();
      }
      if (matchStatus == PlayerStatus.matchDraw) {
        _showMyDialog('Match Draw!😑', 'assets/images/tie.png');
        _clearBoard();
      }
    }

    //Actual Widget
    return Container(
      height: 105,
      width: 105,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
          side: BorderSide(
            color: Color.fromRGBO(100, 100, 100, 1),
          ),
        ),
        padding: EdgeInsets.all(30),
        disabledTextColor: Theme.of(context).accentColor,
        textColor: Theme.of(context).accentColor,
        splashColor: Colors.orange[300],
        onPressed: _buttonPressed,
        child: Obx(
          () => Text(
            '${controller.btValues[contVal]}',
            style: (Theme.of(context).textTheme.headline3),
          ),
        ),
      ),
    );
  }
}
