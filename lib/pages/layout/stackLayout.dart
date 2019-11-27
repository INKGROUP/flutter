import 'package:flutter/material.dart';

//绝对定位

class StackLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
        alignment: Alignment.center,
        fit: StackFit.loose,
        children: <Widget>[
          Positioned(
              child: Text('stacklayout',style: TextStyle(color: Colors.red),),
              left:100,
              top:150,
          ),
          Positioned(
              child: Text('www',style: TextStyle(color: Colors.green),),
              top:100
          ),
          Container(
            child:Text('hello',style: TextStyle(color: Colors.yellowAccent),),
            color: Colors.grey,
          ),
        ],
      );
  }
}