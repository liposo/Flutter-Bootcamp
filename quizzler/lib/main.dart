import 'dart:math';

import 'package:flutter/material.dart';

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
  List<Question> questions = [];
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

  void buildQuestionList() {
    questions.add(Question(
        'As far as has ever been reported, no-one has ever seen an ostrich bury its head in the sand.',
        true));
    questions.add(Question(
        'Approximately one quarter of human bones are in the feet.', true));
    questions.add(Question(
        'In ancient Rome, a special room called a vomitorium was available for diners to purge food in during meals.',
        false));
    questions.add(Question(
        'The average person will shed 10 pounds of skin during their lifetime.',
        false));
    questions.add(
        Question('The Great Wall Of China is visible from the moon.', false));
    questions.add(Question(
        'Virtually all Las Vegas gambling casinos ensure that they have no clocks.',
        true));
    questions.add(Question('The first tea bags were made of silk.', true));
    questions.add(Question('Chai tea comes from Russia.', false));
    questions.add(Question(
        'Horses, ponies, donkeys, mules, and zebras are also known as equines.',
        true));
    questions
        .add(Question('The first domesticated animal was the horse.', false));
    questions.add(Question(
        'Coffee became a popular drink in North America when the Boston Tea Party made tea hard to come by.',
        true));
    questions.add(Question(
        'Most of the world’s coffee in the world is produced in Brazil.',
        true));
    questions.add(
        Question('The original name of The Beatles was the Quarrymen.', true));
    questions.add(
        Question('The driest place on Earth is the Sahara Desert.', false));
    questions
        .add(Question('The world’s largest continent is Antarctica.', false));
    questions.add(Question('Centipedes always have 100 feet.', false));
    questions
        .add(Question('Muscle turns to fat if you stop exercising.', false));
    questions.add(Question(
        'The world’s smallest book is 1cm wide, 1cm tall and 4mm deep.',
        false));
    questions.add(Question(
        'Olympus Mons, Mount Olympus on Mars, is taller than Mount Everest.',
        true));
    questions.add(Question(
        'The world\’s oldest known tree is over 9000 years old.', true));
  }

  void nextQuestion() {
    int index = _random.nextInt(questions.length);
    currentQuestion = questions[index];
    questions.removeAt(index);
  }

  void evaluateAnswer(Question question, bool userAnswer) {
    updateScore(question.answer == userAnswer);
  }

  void updateScore(bool result) {
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
                  restart();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void restart() {
    setState(() {
      questions = [];
      score = [];
      right = 0;
      questionsAnswered = 0;
      currentQuestion = null;
      buildQuestionList();
      nextQuestion();
    });
  }

  @override
  void initState() {
    questions = [];
    score = [];
    right = 0;
    questionsAnswered = 0;
    currentQuestion = null;
    buildQuestionList();
    nextQuestion();
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
                    evaluateAnswer(currentQuestion, true);
                    nextQuestion();
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
                    evaluateAnswer(currentQuestion, false);
                    nextQuestion();
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

class Question {
  String question;
  bool answer;

  Question(this.question, this.answer);

  String getQuestion() {
    return question;
  }

  bool getAnswer() {
    return answer;
  }
}
