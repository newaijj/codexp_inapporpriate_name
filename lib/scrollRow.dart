import 'package:flutter/material.dart';
import "./placeholderContainer.dart";

class ScrollRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: PlaceholderContainer(),
        ),
        Expanded(
          child: PlaceholderContainer(),
        ),
        Expanded(
          child: PlaceholderContainer(),
        ),
      ],
    );
  }
}