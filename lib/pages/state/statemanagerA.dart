import 'package:flutter/material.dart';
// TapboxA 管理自身状态.
class TapboxA extends StatefulWidget{
  TapboxA({Key key}): super(key:key);
  @override
  _TapboxAState createState()=> _TapboxAState();
}

class _TapboxAState extends State<TapboxA>{
  bool _active = false;

  void _handleTap(){
    print('GestureDetector Clicked');
    setState(() {
      _active = !_active;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: _handleTap,
      child: IgnorePointer(
        ignoring: false,
        child: Container(
          child: Center(
            child: Text(
              _active ? 'Active' : 'Inactive',
              style: TextStyle(
                fontSize: 32.0,
                color: Colors.white,
              ),
            ),
          ),
          //RaisedButton(onPressed: ()=> print('1111111111111111')),
          width: 200.0,
          height: 200.0,
          decoration: BoxDecoration(
            color: _active ? Colors.lightGreen[700] : Colors.grey[600],
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
      )
    );
  }
}

class StateManagerA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: TapboxA(),
    );
  }
}
