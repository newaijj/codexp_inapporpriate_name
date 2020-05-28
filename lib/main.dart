import "package:flutter/material.dart";

import "./FitText.dart";
import "./placeholderContainer.dart";
import "./scrollRow.dart";

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {
  var qnIndex = 0;

  void answerQn() {
    setState(() {
      qnIndex = qnIndex + 1;
    });
    print("chosen");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: SizedBox(
                height: 35,
                child: FitText(
                  text: "question text",
                ),
              ),
              centerTitle: true,
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            ScrollRow(),
            ScrollRow(),
            ScrollRow(),
            ScrollRow(),
            ScrollRow(),
            ScrollRow(),
            ScrollRow(),
            ScrollRow(),
            ScrollRow(),
          ])),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return ScrollRow();
            }),
          ),
        ]),
        bottomNavigationBar: BottomAppBar(
          child: PlaceholderContainer(),
        ),
      ),
    );
  }
}
