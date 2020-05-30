import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

class PlaceholderContainer extends StatefulWidget{
  final Color chosenColor = RandomColor().randomColor();
  @override
  State<StatefulWidget> createState(){
    return _PlaceholderContainerState();
  }
}

class _PlaceholderContainerState extends State<PlaceholderContainer>{

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
        color: widget.chosenColor,
      ),
    );
  }
}
/*
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
}*/