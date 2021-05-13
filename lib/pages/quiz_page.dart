import 'package:flutter/material.dart';
import 'package:quizzler/controllers/quiz_controller.dart';
import 'package:quizzler/widgets/quiz_button.dart';

QuizController quizController = QuizController();

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  // todo: 1 - add a reset button and an alert dialog

  void questionValidation(value) {
    setState(() {
      if (quizController.shouldAddIcon(scoreKeeper.length)) {
        var result = quizController.checkAnswer(value);
        scoreKeeper.add(
          Icon(
            result ? Icons.check : Icons.close,
            color: result ? Colors.green : Colors.red,
          ),
        );
        quizController.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              quizController.getQuestion(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ),
        QuizButton(
            title: 'True',
            color: Colors.blue,
            value: true,
            onPressed: () {
              questionValidation(true);
            }),
        QuizButton(
            title: 'False',
            color: Colors.red,
            value: false,
            onPressed: () {
              questionValidation(false);
            }),
        // refact: improve score keeper
        Row(children: scoreKeeper)
      ],
    );
  }
}
