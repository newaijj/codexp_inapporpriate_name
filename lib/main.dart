import "package:flutter/material.dart";

import "pages/all.dart";

void main() {
  runApp(App(),

  );
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<App> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => ScrollPage(),
        "/about": (context) => AboutPage(),
      },
    );
  }
}
