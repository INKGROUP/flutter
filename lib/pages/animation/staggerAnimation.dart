import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class StaggerApp extends StatelessWidget {
  StaggerApp({Key key, this.controller}) : super(key: key) {
    height = Tween<double>(
      begin: .0,
      end: 300.0,
    ).animate(
      CurvedAnimation(
          parent: controller, curve: Interval(0.0, 0.6, curve: Curves.ease)),
    );

    color = ColorTween(begin: Colors.green, end: Colors.red).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.6, curve: Curves.ease),
      ),
    );

    padding = Tween<EdgeInsets>(
      begin: EdgeInsets.only(left: .0),
      end: EdgeInsets.only(left: 100.0),
    ).animate(
      CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.6,
            1.0,
            curve: Curves.ease,
          )),
    );
  }

  final Animation<double> controller;
  Animation<double> height;
  Animation<Color> color;
  Animation<EdgeInsets> padding;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: padding.value,
      child: Container(
        color: color.value,
        width: 5.0,
        height: height.value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}

class StaggerAnimation extends StatefulWidget {
  @override
  _StaggerRouteState createState() => _StaggerRouteState();
}

class _StaggerRouteState extends State<StaggerAnimation>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
  }

  Future<Null> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } on TickerCanceled {}
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _playAnimation();
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    border: Border.all(
                      color: Colors.red.withOpacity(0.5),
                    ),
                  ),
                  child: StaggerApp(
                    controller: _controller,
                  ),
                ),
              SizedBox(height: 20,),
              Text("请点击屏幕"),
            ],
          ),
        ),
      ),
    );
  }
}
