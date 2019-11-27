import 'package:flutter/material.dart';

class Index extends StatelessWidget {

  static const TextStyle _titleStyle = TextStyle(fontWeight: FontWeight.bold,fontSize: 20);

  BoxDecoration _boxDecoration(BuildContext context){
    return BoxDecoration(
      border:Border(
        bottom: Divider.createBorderSide(context,color: Colors.grey),
      )
    );
  }

  Container _container( BuildContext context, String name, String route){
    return Container(
      child: ListTile(
        contentPadding:EdgeInsets.only(left: 10,),
        title: Text(name, style: _titleStyle,),
        onTap: (){
          Navigator.pushNamed(context, route);
        },
      ),
      decoration: _boxDecoration(context),
    );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'TestList',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Index'),
        ),
        body: ListView(
          padding: EdgeInsets.only(left: 10,right: 10,),
          children: <Widget>[
            _container(context, 'animation', '/basicAnimation'),
            _container(context, 'animation2', '/basicAnimation2'),
            _container(context, 'builderAnimation', '/builderAnimation'),
            _container(context, 'heroAnimation', '/heroAnimation'),
            _container(context, 'staggerAnimation', '/staggerAnimation'),
            _container(context, 'swicherAnimation', '/switcherAnimated'),

            _container(context, 'appBar', '/appBarDemo'),
            _container(context, 'tabBar', '/tabBarDemo'),
            _container(context, 'bottomNavigationBar', '/bottomNavigationBar'),

            _container(context, 'baseLayout', '/baseLayout'),
            _container(context, 'layout', '/layout'),
            _container(context, 'stacklayout', '/stacklayout'),

            _container(context, 'route', '/dynamicRoute'),
            _container(context, 'route2', '/dynamicRoute2'),

            _container(context, 'stateA', '/stateA'),
            _container(context, 'stateB', '/stateB'),
            _container(context, 'stateC', '/stateC'),

            _container(context, 'counter', '/counter'),
            _container(context, 'counter2', '/counter2'),
            _container(context, 'listView', '/randomWordsListView'),
            _container(context, 'listView2', '/randomWordsListView2'),
            _container(context, 'shoppingCart', '/shoppingCart'),

          ],
        ),
      ),
    );
  }
}

