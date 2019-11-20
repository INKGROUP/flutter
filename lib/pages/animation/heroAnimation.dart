import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';


class HeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          child: Hero(
            tag: "avatar",
            child: Material(
              child: InkWell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlutterLogo(),
                    SizedBox(height: 20,),
                    Text('请点击LOGO'),
                  ],
                ),
                onTap: () {
                  Navigator.push(context, PageRouteBuilder(
                    pageBuilder: (BuildContext context, Animation animation,
                        Animation secondayAnimation) {
                      return new FadeTransition(
                        opacity: animation,
                        child: Scaffold(
                          appBar: AppBar(
                            title: Text('back'),
                          ),
                          body: HeroAnimateRouteB(),
                        ),
                      );
                    },
                  ));
                },
              ),
            ),
          ),
        ),
      )
    );
  }
}

class HeroAnimateRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Hero(
        tag: 'avatar',
        child: FlutterLogo(),
      ),
    );
  }
}
