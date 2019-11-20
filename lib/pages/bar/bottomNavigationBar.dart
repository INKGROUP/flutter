import 'package:flutter/material.dart';

class BNBar extends StatelessWidget{
  static const String _title = 'BNBar';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: _title,
      home: BNavigationBar(),
    );
  }
}


class BNavigationBar extends StatefulWidget {
  BNavigationBar({Key key}) : super(key: key);
  @override
  _BNavigationBar createState() => _BNavigationBar();


}

class _BNavigationBar extends State<BNavigationBar> {
  int _selectIndex = 0;
  static const TextStyle optionStle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStle,
    ),
    Text(
      'Index 1:Business',
      style: optionStle,
    ),
    Text(
      'Index 2: School',
      style: optionStle,
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });

    if( index == 1 ){
      Navigator.pushNamed(context, '/layout');
    }

  }

  @override
  void initState(){
    super.initState();
    print('****initState');
    WidgetsBinding.instance.addPostFrameCallback((_){
      print('WidgetsBinding');
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('****didChangeDependencies');
  }

  @override
  void didUpdateWidget(BNavigationBar oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('****didUpdateWidget');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('****dispose');
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('****deactivate');
  }



  @override
  Widget build(BuildContext context) {
    print('****build');
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Demo'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectIndex),
      ),
      bottomNavigationBar:
          BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), title: Text("Home")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.business), title: Text("Business")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.school), title: Text("School")),
            ],
            currentIndex: _selectIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
          ),
    );
  }
}
