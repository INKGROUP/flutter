import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class BasicAnimation extends StatefulWidget {
  @override
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<BasicAnimation> with SingleTickerProviderStateMixin{
  Animation<double> animation;
  AnimationController controller;

  @override
  void  initState(){
    super.initState();
    controller = AnimationController(duration:const Duration(milliseconds: 1000),vsync: this);
    animation = Tween<double>(begin: 0,end: 300).animate(controller)
      ..addListener((){
        setState(() {

        });
      });
    //监听状态，做无限循环
//      ..addStatusListener((status){
//        if( status == AnimationStatus.completed ) {
//          controller.reverse();
//        } else if( status == AnimationStatus.dismissed ) {
//          controller.forward();
//        }
//      });
    controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Container(
          child: FlutterLogo(),
          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
          height: animation.value,
          width: animation.value,
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
}