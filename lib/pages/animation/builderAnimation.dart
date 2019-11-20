import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class LogoWidget extends StatelessWidget {
  Widget build(BuildContext buildContext) => Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: FlutterLogo(),
      );
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation animation;

  static final _opacityTween = Tween<double>(begin: 0.1,end: 1.0);
  static final _sizeTween = Tween<double>(begin: 1.0,end: 300);
  static final _colorTween = ColorTween(begin: Colors.red,end: Colors.white);

  Widget build(BuildContext context) =>
      Center(
          child: AnimatedBuilder(
              animation: animation,
              builder: (context,child) => Opacity(
                opacity: _opacityTween.evaluate(animation),
                child: Container(
                  height: _sizeTween.evaluate(animation),
                  width: _sizeTween.evaluate(animation),
                  color: _colorTween.evaluate(animation),
                  child: child,
                ),
              ),
              child: child,
          ));
}

class BuilderAnimation extends StatefulWidget {
  @override
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<BuilderAnimation> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller  = AnimationController(duration:const Duration(seconds: 2),vsync: this);
    //animation = Tween<double>(begin: 0,end: 300).animate(controller);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: GrowTransition(
        child: LogoWidget(),
        animation: animation,
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
