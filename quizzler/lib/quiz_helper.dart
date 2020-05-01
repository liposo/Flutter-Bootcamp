import 'dart:math';

import 'question.dart';

class QuizHelper {
  final _random = new Random();

  Question _currentQuestion;
  List<Question> _answeredQuestions = [];

  List<Question> _questions = [
    Question(
        'As far as has ever been reported, no-one has ever seen an ostrich bury its head in the sand.',
        true),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question(
        'In ancient Rome, a special room called a vomitorium was available for diners to purge food in during meals.',
        false),
    Question(
        'The average person will shed 10 pounds of skin during their lifetime.',
        false),
    Question('The Great Wall Of China is visible from the moon.', false),
    Question(
        'Virtually all Las Vegas gambling casinos ensure that they have no clocks.',
        true),
    Question('The first tea bags were made of silk.', true),
    Question('Chai tea comes from Russia.', false),
    Question(
        'Horses, ponies, donkeys, mules, and zebras are also known as equines.',
        true),
    Question('The first domesticated animal was the horse.', false),
    Question(
        'Coffee became a popular drink in North America when the Boston Tea Party made tea hard to come by.',
        true),
    Question(
        'Most of the world’s coffee in the world is produced in Brazil.', true),
    Question('The original name of The Beatles was the Quarrymen.', true),
    Question('The driest place on Earth is the Sahara Desert.', false),
    Question('The world’s largest continent is Antarctica.', false),
    Question('Centipedes always have 100 feet.', false),
    Question('Muscle turns to fat if you stop exercising.', false),
    Question(
        'The world’s smallest book is 1cm wide, 1cm tall and 4mm deep.', false),
    Question(
        'Olympus Mons, Mount Olympus on Mars, is taller than Mount Everest.',
        true),
    Question('The world\’s oldest known tree is over 9000 years old.', true)
  ];

  String getCurrentQuestion() {
    return _currentQuestion.getQuestion();
  }

  void startQuiz() {
    _answeredQuestions = [];
    nextQuestion();
  }

  void nextQuestion() {
    int index = _random.nextInt(_questions.length);
    while (_isQuestionAnswered(_questions[index])) {
      index = _random.nextInt(_questions.length);
    }
    _currentQuestion = _questions[index];
  }

  bool _isQuestionAnswered(Question question) {
    print(_answeredQuestions.contains(question));
    return _answeredQuestions.contains(question);
  }

  bool isFinished() {
    return _answeredQuestions.length > 14;
  }

  bool evaluateAnswer(bool userAnswer) {
    _answeredQuestions.add(_currentQuestion);
    bool result = _currentQuestion.getAnswer() == userAnswer;
    nextQuestion();

    return result;
  }
}
