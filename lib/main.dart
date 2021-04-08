import 'package:flutter/material.dart';
import 'package:tictactoe/widgets/buttonRow.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.orange,
        accentColor: Colors.orange[400],
        scaffoldBackgroundColor: Colors.black,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tic Tac Toe!'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
          // child: Text('Test'),
        ),
      ),
    );
  }
}
