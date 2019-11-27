import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidget createState() => _FavoriteWidget();
}

class _FavoriteWidget extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        --_favoriteCount;
        _isFavorited = false;
      } else {
        ++_favoriteCount;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: _isFavorited ? Icon(Icons.star) : Icon(Icons.star_border),
            color: Colors.red,
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Text('$_favoriteCount'),
        ),
      ],
    );
  }
}

class Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    Widget titleSection = Container(
      padding: const EdgeInsets.all(18),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 18),
                  child: Text(
                    'Oeschinen Lake CampgroundOeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          FavoriteWidget(),
        ],
      ),
    );

    Column _buildButtonColumn(Color color, IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Listener(
            child: Column(
              children: <Widget>[
                Icon(
                  icon,
                  color: color,
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Text(
                    label,
                    style: TextStyle(
                      color: color,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            onPointerUp: (PointerEvent event) => print('1'),
            onPointerDown: (PointerEvent event) => print('2'),
            onPointerMove: (PointerEvent event) => print('3'),
            onPointerCancel: (PointerEvent event) => print('4'),
          ),
        ],
      );
    }

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = Container(
        padding: EdgeInsets.all(18),
        child: Column(
          children: <Widget>[
            Text(
              'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
              'Alps. Situated 1,578 meters above sea level, it is one of the '
              'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
              'half-hour walk through pastures and pine forest, leads you to the '
              'lake, which warms to 20 degrees Celsius in the summer. Activities '
              'enjoyed here include rowing, and riding the summer toboggan run.',
              softWrap: true,
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
                      'Alps. Situated 1,578 meters above sea level, it is one of the ',
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      'lake, which warms to 20 degrees Celsius in the summer. Activities '
                      'enjoyed here include rowing, and riding the summer toboggan run.',
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));

    Widget imgSection = Image.asset(
      'images/bg.png',
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('layout demo'),
      ),
      body: ListView(
        children: <Widget>[
          imgSection,
          titleSection,
          buttonSection,
          textSection,
        ],
      ),
    );
  }
}
