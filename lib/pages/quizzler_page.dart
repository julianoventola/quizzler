import 'package:flutter/material.dart';
import 'package:quizzler/pages/quiz_page.dart';

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
