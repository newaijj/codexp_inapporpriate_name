import 'package:flutter/material.dart';

class FitText extends StatelessWidget {
  final String text;

  FitText({this.text});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit:BoxFit.fitWidth,
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
