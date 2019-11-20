import 'package:flutter/material.dart';

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text('tabBar'),
            ),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'Bike',
                  icon: Icon(Icons.directions_bike),
                ),
                Tab(
                  text: 'Run',
                  icon: Icon(Icons.directions_run),
                ),
                Tab(
                  text: 'Walk',
                  icon: Icon(Icons.directions_walk),
                ),
              ],
            ),
          ),
          body: TabBarView(
              children: [
                Icon(Icons.directions_run),
                Text("Second"),
                Image.asset(
                  'images/hd2.jpg',
                  width: 300,
                  height: 300,
                )
              ]
          ),
        ));
  }
}
