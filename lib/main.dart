import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictactoe/controller/ticTacController.dart';
import 'package:tictactoe/widgets/buttonRow.dart';
import 'package:tictactoe/widgets/difficulty.dart';
import 'package:tictactoe/widgets/streak.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(
        TicTacController()); //Initializing the controller so that it can be used in other widgets

    //Material App entry point
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.orange,
          accentColor: Colors.orange[400],
          scaffoldBackgroundColor: Colors.black,
          textTheme: TextTheme(
            headline3: TextStyle(color: Colors.orange),
          ),
          fontFamily: 'HashedBrowns'),
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe!'),
      ),
      body: Column(
        children: [
          DifficultyChooser(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Streak(),
                ButtonRow(
                  btn1: 0,
                  btn2: 1,
                  btn3: 2,
                ),
                ButtonRow(
                  btn1: 3,
                  btn2: 4,
                  btn3: 5,
                ),
                ButtonRow(
                  btn1: 6,
                  btn2: 7,
                  btn3: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
