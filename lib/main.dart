import "package:flutter/material.dart";

import "pages/all.dart";

void main() {
  runApp(App(),);
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
      debugShowCheckedModeBanner: false,
      initialRoute: "/mondrian",
      
      onGenerateRoute: (RouteSettings settings){
        Route page;
        switch (settings.name){
          case "/animation":
            page = AnimationsPlayground.route();
            break;
        }
        return page;
      },
      
      routes: {
        "/scroll": (context) => ScrollPage(),
        "/about": (context) => AboutPage(),
        "/userInput": (context) => FormPage(),
        "/mondrian": (context) => MondrianPage(),
      },
    );
  }
}
