import "package:flutter/material.dart";
import "package:flutter/animation.dart";
import 'package:flutter/semantics.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget{
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin{
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState(){
    super.initState();
    controller = 
      AnimationController(duration:const Duration(seconds:3), vsync:this);
    animation = Tween<double>(begin:0,end:300).animate(controller)
      ..addListener((){
        setState((){

        });

      });
    controller.forward();
  }
  
  
  @override
  Widget build(BuildContext context){
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      )
    );
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
}
