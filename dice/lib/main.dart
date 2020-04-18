import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dice'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(children: [
        Expanded(
          child: FlatButton(
            onPressed: () { print("Left pressed!"); },
            child: Image.asset('images/dice1.png'),
          ),
        ),
        Expanded(
          child: FlatButton(
            onPressed: () { print("Right pressed"); },
            child: Image.asset('images/dice2.png'),
          ),
        )
      ]),
    );
  }
}
