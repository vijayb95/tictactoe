import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoe/controller/ticTacController.dart';

class Streak extends StatelessWidget {
  const Streak({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TicTacController controller = Get.find();
    return Column(
      children: [
        Container(
          height: 40,
          width: 315,
          color: Colors.orange,
          child: Center(
              child: Text(
            'Streak!',
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.w400),
          )),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          height: 50,
          width: 315,
          decoration: BoxDecoration(
            border: new Border.all(
                color: Colors.orange, width: 2.5, style: BorderStyle.solid),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 155,
                color: Colors.orange[300],
                child: Center(
                    child: Obx(() => Text(
                          'Player: ${controller.playerStreak.value}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ))),
              ),
              Container(
                height: 50,
                width: 155,
                child: Center(
                    child: Obx(() => Text(
                          'Device: ${controller.botStreak.value}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ))),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
