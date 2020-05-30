import "package:flutter/material.dart";
import 'package:flutterapp/pages/utils/all.dart';

Animation<double> controller;
Animation<Offset> imageTranslation;
Animation<Offset> textTranslation;
Animation<Offset> buttonTranslation;
Animation<double> imageOpacity;
Animation<double> textOpacity;
Animation<double> buttonOpacity;

class AnimationsPlayground extends StatelessWidget {

  static Route<dynamic> route(){
    return PageRouteBuilder(
      transitionDuration: const Duration(seconds:5),
      pageBuilder: (BuildContext context, Animation<double> animation, 
        Animation<double> secondaryAnimation){
          return AnimationsPlayground();
      },
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: AnimationPage(),
    );
  }

  
}


class AnimationPage extends StatefulWidget {
  

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  
  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    controller = ModalRoute.of(context).animation;

    imageTranslation = Tween(
      begin: Offset(0.0, 1.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.67, curve: Curves.fastOutSlowIn),
      ),
    );
    
  }

  

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child){ 
        return Scaffold(
          appBar: AppBar(
            title: FitText(text:"Animations Demo"),
          ),
          drawer: MyDrawer(),
          body: Column(
            children: [
              Expanded(
                child: FractionalTranslation(
                  translation: imageTranslation.value,
                  child: FitText(text:"text 1"),
                ),
              ),
              Expanded(
                flex: 2,
                child: FitText(text:"text 1"),
              ),
              Expanded(
                child: FitText(text:"text 1"),
              ),
            ]
          ),
      );
    }
  );
  }
}