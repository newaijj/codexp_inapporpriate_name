import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

class PlaceholderContainer extends StatelessWidget {
  final RandomColor _randomColor = RandomColor();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.white,
        ),
      ),
      child: Container(
        color: _randomColor.randomColor(),
      ),
    );
  }
}