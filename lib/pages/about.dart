import 'package:flutter/material.dart';

import "utils/all.dart";

class AboutPage extends StatefulWidget {

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: FitText(
          text:"About Page",
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}