import 'package:flutter/material.dart';

class QuizButton extends StatelessWidget {
  final String title;
  final Color color;
  final bool value;
  final VoidCallback onPressed;

  const QuizButton(
      {Key? key,
      required this.title,
      required this.color,
      required this.value,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: TextButton(
          style: ButtonStyle(
            textStyle:
                MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 20)),
            backgroundColor: MaterialStateProperty.all<Color>(
              color,
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              Colors.white,
            ),
          ),
          onPressed: onPressed,
          child: Text(title),
        ),
      ),
    );
  }
}
