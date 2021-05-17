import 'package:quizzler/models/question.dart';

class QuizController {
  var _questionNumber = 0;
  final _questions = [
    Question(questionText: 'É terça-feira hoje?', questionAnswer: false),
    Question(
        questionText:
            'Uma pessoa adulta normalmente dorme pelo menos 6 horas por dia!',
        questionAnswer: true),
    Question(
        questionText: 'Estudar é o melhor para o seu furuto!',
        questionAnswer: true),
  ];

  bool checkAnswer(bool value) {
    return _questions[_questionNumber].questionAnswer == value;
  }

  String getQuestion() {
    return _questions[_questionNumber].questionText;
  }

  void nextQuestion() {
    if (isFinished()) {
      _questionNumber++;
    }
  }

  void startAgain() {
    _questionNumber = 0;
  }

  bool shouldAddIcon(int answers) => answers < _questions.length;
  bool isFinished() => _questionNumber < _questions.length - 1;
}
