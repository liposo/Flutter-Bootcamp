import 'dart:math';

import 'package:flutter/material.dart';

import 'question.dart';
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
  int right = 0;
  int questionsAnswered = 0;
  Question currentQuestion;

  final _random = new Random();

  Icon checkIcon() {
    return Icon(
      Icons.check,
      color: Colors.green,
    );
  }

  Icon closeIcon() {
    return Icon(
      Icons.close,
      color: Colors.red,
    );
  }

  void _nextQuestion() {
    int index = _random.nextInt(quizHelper.getNumberOfQuestions());
    currentQuestion = quizHelper.getQuestion(index);

    //TODO prevent repeated questions
  }

  void _evaluateAnswer(bool userAnswer) {
    _updateScore(currentQuestion.answer == userAnswer);
  }

  void _updateScore(bool result) {
    setState(() {
      if (questionsAnswered < 16) {
        if (result) {
          right++;
          score.add(checkIcon());
        } else {
          score.add(closeIcon());
        }
        questionsAnswered++;
        if (questionsAnswered == 15) {
          _showScore();
        }
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
            content: Text('Score: $right/15'),
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
      right = 0;
      questionsAnswered = 0;
      currentQuestion = null;
      _nextQuestion();
    });
  }

  @override
  void initState() {
    score = [];
    right = 0;
    questionsAnswered = 0;
    currentQuestion = null;
    _nextQuestion();
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
                currentQuestion.question,
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
                    _evaluateAnswer(true);
                    _nextQuestion();
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
                    _evaluateAnswer(false);
                    _nextQuestion();
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
