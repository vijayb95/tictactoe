import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoe/controller/ticTacController.dart';
// import 'package:tictactoe/model/ticTacList.dart';

class BtnContainer extends StatelessWidget {
  final contVal;
  BtnContainer({Key key, this.contVal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TicTacController controller = Get.put(TicTacController());
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
        onPressed: () {
          controller.changePositionalValue(contVal, 'X');
        },
        // child: Text(contVal.toString()),
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
