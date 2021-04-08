import 'package:flutter/material.dart';
import 'package:tictactoe/model/ticTacList.dart';

class BtnContainer extends StatelessWidget {
  final contVal;
  BtnContainer({Key key, this.contVal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
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
          
          print(contVal);
        },
        child: Text(contVal.toString()),
      ),
    );
  }
}
