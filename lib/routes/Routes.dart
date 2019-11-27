import 'package:flutter/material.dart';

import '../pages/index/index.dart';
//animation
import '../pages/animation/basicAnimation.dart';
import '../pages/animation/basicAnimation2.dart';
import '../pages/animation/builderAnimation.dart';
import '../pages/animation/heroAnimation.dart';
import '../pages/animation/staggerAnimation.dart';
import '../pages/animation/switcherAnimated.dart';

//bar
import '../pages/bar/bottomNavigationBar.dart';
import '../pages/bar/tabBarDemo.dart';
import '../pages/bar/appBarDemo.dart';

//layout
import '../pages/layout/baseLayout.dart';
import '../pages/layout/layout.dart';
import '../pages/layout/stackLayout.dart';

//route
import '../pages/route/dynamicRoute.dart';
import '../pages/route/dynamicRoute2.dart';

//state
import '../pages/state/statemanagerA.dart';
import '../pages/state/statemanagerB.dart';
import '../pages/state/statemanagerC.dart';

//test
import '../pages/test/counter.dart';
import '../pages/test/counter2.dart';
import '../pages/test/randomWordsListView.dart';
import '../pages/test/randomWordsListView2.dart';
import '../pages/test/shoppingCart.dart';

final routes = {
  '/': (context) => Index(),
  '/tabBarDemo' : (context) => TabBarDemo(),
  '/appBarDemo' : (context) => AppBarDemo(),
  '/bottomNavigationBar' : (context) => BNavigationBar(),
  '/basicAnimation': (context) => BasicAnimation(),
  '/basicAnimation2': (context) => BasicAnimation2(),
  '/builderAnimation': (context) => BuilderAnimation(),
  '/heroAnimation': (context) => HeroAnimation(),
  '/staggerAnimation': (context) => StaggerAnimation(),
  '/switcherAnimated': (context) => SwitcherAnimated(),
  '/baseLayout': (context) => BaseLayout(),
  '/layout': (context) => Layout(),
  '/stacklayout': (context) => StackLayout(),
  '/dynamicRoute': (context) => DynamicRoute(),
  '/dynamicRoute2': (context) => DynamicRoute2(),
  '/stateA': (context) => StateManagerA(),
  '/stateB': (context) => StateManagerB(),
  '/stateC': (context) => StateManagerC(),
  '/counter':(context) => Counter(),
  '/counter2':(context) => Counter2(),
  '/randomWordsListView' :(context) => RandomWordsListView(),
  '/randomWordsListView2' :(context) => RandomWordsListView2(),
  '/shoppingCart' : (context) => ShoppingCart(),
};

var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];

  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, argumengs: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
