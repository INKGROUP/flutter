import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment(){
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Count: $_counter'),
          SizedBox(height: 30,),
          RaisedButton(
            onPressed: _increment,
            child: Text('Increment'),
          ),
        ],
    );
  }
}