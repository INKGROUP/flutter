import 'package:flutter/material.dart';

class SwitcherAnimated extends StatefulWidget {
  SwitcherAnimated({Key key}) : super(key: key);

  @override
  _AnimatedSwitcher createState() => _AnimatedSwitcher();
}

class _AnimatedSwitcher extends State<SwitcherAnimated> {
  int _count = 1;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              /**
           * 数字演示
           */
//              child: Text(
//                '$_count',
//                key: ValueKey<int>(_count),
//                style: Theme.of(context).textTheme.display1,
//              ),
              /**
               * 图片演示
               */
              child: Image.asset(
                'images/hd$_count.jpg',
                height: 300,
                width: 300,
                key: ValueKey(_count),//如果没有这个，看看是什么效果
              ),
              transitionBuilder: (Widget child, Animation animation) {
                //缩放效果
               // return ScaleTransition(child: child, scale: animation);
                //旋转效果
                return RotationTransition(
                  child: child,
                  alignment: Alignment.center,
                  turns: animation,
                );
              },
            ),
            RaisedButton(
              child: const Text(
                '+1',
              ),
              onPressed: () {
                setState(() {
                  if( _count > 2 ) {
                    _count = 1;
                  } else{
                    _count += 1;
                  }

                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
