import 'package:flutter/material.dart';

class QuizzlerPage extends StatelessWidget {
  const QuizzlerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: QuizPage(),
      )),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
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
              'This is where the question text will go',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: TextButton(
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all<TextStyle>(
                    TextStyle(fontSize: 20)),
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.green,
                ),
                foregroundColor: MaterialStateProperty.all<Color>(
                  Colors.white,
                ),
              ),
              onPressed: () {},
              child: Text('True'),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: TextButton(
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all<TextStyle>(
                    TextStyle(fontSize: 20)),
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.red,
                ),
                foregroundColor: MaterialStateProperty.all<Color>(
                  Colors.white,
                ),
              ),
              onPressed: () {},
              child: Text('False'),
            ),
          ),
        )
      ],
    );
  }
}
