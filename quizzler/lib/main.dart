import 'package:flutter/material.dart';
import 'package:quizzler/icon_helper.dart';

import 'quiz_helper.dart';

QuizHelper quizHelper = QuizHelper();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> score = [];
  int correctAnswers = 0;

  void _updateScore(bool userAnswer) {
    setState(() {
      if (quizHelper.evaluateAnswer(userAnswer)) {
        correctAnswers++;
        score.add(IconHelper().checkIcon());
      } else {
        score.add(IconHelper().closeIcon());
      }
      if (quizHelper.isFinished()) {
        _showScore();
      }
    });
  }

  void _showScore() {
    // flutter defined function
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return WillPopScope(
          // Prevent dialog closing from back button on Android
          // ignore: missing_return
          onWillPop: () {},
          child: AlertDialog(
            content: Text('Score: $correctAnswers'),
            actions: [
              FlatButton(
                child: Text('Restart'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _restart();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _restart() {
    setState(() {
      score = [];
      correctAnswers = 0;
      quizHelper.startQuiz();
    });
  }

  @override
  void initState() {
    score = [];
    correctAnswers = 0;
    quizHelper.startQuiz();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizHelper.getCurrentQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  child: Text(
                    "True",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  onPressed: () {
                    _updateScore(true);
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                  textColor: Colors.white,
                  color: Colors.red,
                  child: Text(
                    "False",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  onPressed: () {
                    _updateScore(false);
                  },
                ),
              ),
            ),
          ],
        ),
        Row(
          children: score,
        ),
      ],
    );
  }
}
