import 'package:flutter/material.dart';
import 'package:tictactoe/widgets/BtnContainer.dart';

class ButtonRow extends StatelessWidget {
  final btn1;
  final btn2;
  final btn3;

  const ButtonRow({Key key, this.btn1, this.btn2, this.btn3}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BtnContainer(contVal: btn1,),
        BtnContainer(contVal: btn2,),
        BtnContainer(contVal: btn3,),
      ],
    );
  }
}
