import 'package:flutter/material.dart';

class CounterDisplay extends StatelessWidget {
  CounterDisplay({this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('Count:$count');
  }
}

class CounterIncrementor extends StatelessWidget {
  CounterIncrementor({this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      child: Text('Increment'),
      onPressed: onPressed,
    );
  }
}

class Counter2 extends StatefulWidget {
  @override
  _CounterState createState()=> _CounterState();
}

class _CounterState extends State<Counter2>{
  int _counter = 0;

  void _increment(){
    setState(() {
      ++_counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CounterDisplay(count: _counter),
        SizedBox(width: 20.0),
        CounterIncrementor(onPressed: _increment),
      ],
    );
  }
}
