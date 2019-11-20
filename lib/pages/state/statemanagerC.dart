import 'package:flutter/material.dart';

//TapboxC,和StateManager都管理各自的状态

class StateManagerC extends StatefulWidget{
  @override
  _ParentWidgetState createState()=>_ParentWidgetState();
}

class _ParentWidgetState extends State<StateManagerC>{
  bool _active = false;

  void _handleTapboxChanged(bool newValue){
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: TapboxC(
          active: _active,
          onChanged: _handleTapboxChanged
      ),
    );
  }
}

//组件C
class TapboxC extends StatefulWidget{
  TapboxC({Key key, this.active:false, @required this.onChanged})
      :super(key:key);

  final bool active;
  final ValueChanged<bool> onChanged;
  @override
  _TapboxCState createState()=>_TapboxCState();
}

class _TapboxCState extends State<TapboxC>{
  bool _highLight = false;

  void _handleTapDown(TapDownDetails){
    setState(() {
      _highLight = true;
    });
  }

  void _handleTapUp(TapUpDetails){
    setState(() {
      _highLight = false;
    });
  }

  void _handleTapCancel(){
    setState(() {
      _highLight = false;
    });
  }

  void _handleTap(){
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: Container(
        child: Center(
          child: Text(widget.active ? 'Active' : 'Inactive',
          style: TextStyle(fontSize: 32.0,color: Colors.white),),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highLight ? Border.all(
            color: Colors.teal[700],
            width:10.0,
          ): null
        ),
        ),
      );

  }
}
