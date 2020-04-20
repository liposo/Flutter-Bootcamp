import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "Ask me anything!",
            style: TextStyle(color: Colors.black45),
          ),
        ),
        body: Magic8Ball(),
      ),
    ),
  );
}

class Magic8Ball extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Magic8Ball> {
  var ballList = [
    "images/ball1.png",
    "images/ball2.png",
    "images/ball3.png",
    "images/ball4.png",
    "images/ball5.png",
  ];

  // Generates a new Random object
  final _random = new Random();

  String randomItemFromList() {
    return ballList[_random.nextInt(ballList.length)];
  }

  String selectedImage = "images/ball1.png";

  void getRandomImage() {
    setState(() {
      selectedImage = randomItemFromList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: FlatButton(
          onPressed: () {
            getRandomImage();
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Image.asset(selectedImage),
        ),
      ),
    );
  }
}
