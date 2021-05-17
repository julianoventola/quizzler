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
  var score = 0;

  void questionValidation(value) {
    setState(() {
      if (quizController.shouldAddIcon(scoreKeeper.length)) {
        var result = quizController.checkAnswer(value);
        score += result ? 10 : 0;
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

  void resetGame() {
    setState(() {
      score = 0;
      scoreKeeper = [];
      quizController.startAgain();
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
                fontSize: 18,
                fontFamily: 'PressStart2P',
              ),
            ),
          ),
        ),
        QuizButton(
            title: 'Verdadeiro',
            color: Colors.blue,
            value: true,
            onPressed: () {
              questionValidation(true);
            }),
        QuizButton(
            title: 'Falso',
            color: Colors.red,
            value: false,
            onPressed: () {
              questionValidation(false);
            }),
        Row(children: scoreKeeper),
        Row(
          children: [
            Expanded(
              flex: 4,
              child: Text(
                'Score: $score pontos',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: score > 0 ? Colors.green : Colors.white,
                  fontSize: 20,
                  fontFamily: 'PressStart2P',
                ),
              ),
            ),
            Expanded(
              child: IconButton(
                icon: Icon(
                  Icons.refresh,
                  color: Colors.yellow,
                ),
                onPressed: resetGame,
              ),
            )
          ],
        ),
      ],
    );
  }
}
