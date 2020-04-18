import 'package:flutter/material.dart';
import "dart:math";

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

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  // List of all dice images;
  var diceList = [
    "images/dice1.png",
    "images/dice2.png",
    "images/dice3.png",
    "images/dice4.png",
    "images/dice5.png",
    "images/dice6.png"
  ];

  // Generates a new Random object
  final _random = new Random();

  String rollDice() {
    return diceList[_random.nextInt(diceList.length)];
  }

  String leftDice = "images/dice1.png";
  String rightDice = "images/dice1.png";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
          child: Center(
            child: Text(
              "Touch each dice to roll, use the buttom to roll both at once.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
        Row(children: [
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  leftDice = rollDice();
                });
              },
              child: Image.asset(leftDice),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  rightDice = rollDice();
                });
              },
              child: Image.asset(rightDice),
            ),
          ),
        ]),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: RaisedButton(
            onPressed: () {
              setState(() {
                leftDice = rollDice();
                rightDice = rollDice();
              });
            },
            color: Colors.white,
            padding: EdgeInsets.all(28.0),
            child: Center(
              child: Text(
                "Roll both dices",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
