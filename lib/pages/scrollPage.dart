import "package:flutter/material.dart";

import "utils/all.dart";


class ScrollPage extends StatefulWidget {
  @override
  _ScrollPageState createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(onScroll);
  }

  double scrollProgress = 0.0;

  onScroll() {
    setState(() {
      scrollProgress = controller.offset;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Row(
            children: [
              FitText(
                text: "text",
              ),
              Container(
                width: scrollProgress,
                height: 35,
                color: Colors.red,
              ),
            ]
          ),
        ),
        drawer: MyDrawer(),
        body: CustomScrollView(controller: controller, slivers: <Widget>[
          
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              if (index > 10) return null;
              return ScrollRow();
            }),
          ),
        ]),
        bottomNavigationBar: BottomAppBar(
          child: PlaceholderContainer(),
        ),
      );
  }
}